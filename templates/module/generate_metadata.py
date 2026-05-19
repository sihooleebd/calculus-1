import json
import re
from pathlib import Path

def scan_module(mod_dir: Path):
    """Scans a module directory for metadata."""
    metadata = {
        "name": mod_dir.name,
        "version": "0.1.0",
        "dependencies": [],
        "exports": []
    }
    
    deps = set()
    exports = set()
    
    # 1. Scan for exports in mod.typ (and recursive imports?)
    # For MVP, we assume mod.typ exports * from subfiles. 
    # We scan ALL .typ files in the module to find #let declarations.
    for f in mod_dir.rglob("*.typ"):
        content = f.read_text()
        
        # Regex for #let name
        # Exclude private definitions starting with _
        matches = re.finditer(r'#let\s+([a-zA-Z][a-zA-Z0-9_-]*)', content)
        for m in matches:
            exports.add(m.group(1))
            
        # Regex for Imports from sibling modules: #import "../shape/..."
        # We look for ".." followed by a folder name that is NOT the current module
        # Pattern: import\s+"(\.\./([a-zA-Z0-9_-]+)/.*?)"
        dep_matches = re.finditer(r'import\s+"(\.\./([a-zA-Z0-9_-]+)/.*?)"', content)
        for m in dep_matches:
            target_mod = m.group(2)
            if target_mod != mod_dir.name:
                deps.add(target_mod)
    
    metadata["dependencies"] = sorted(list(deps))
    metadata["exports"] = sorted(list(exports))
    
    return metadata

import sys

def main():
    root = Path(".")
    if len(sys.argv) > 1:
        root = Path(sys.argv[1])
        
    print(f"Scanning directory: {root.resolve()}")

    # Check if the root itself is a module
    if (root / "mod.typ").exists():
        print(f"detected single module: {root.name}")
        meta = scan_module(root)
        with open(root / "metadata.json", "w") as f:
            json.dump(meta, f, indent=4)
        print(f"  -> Generated metadata.json for {root.name}")
        return

    # Assume we run this from the root of the modules repo
    # Iterate all subdirectories that look like modules (contain mod.typ)
    for d in root.iterdir():
        if d.is_dir() and (d / "mod.typ").exists():
            print(f"Scanning {d.name}...")
            meta = scan_module(d)
            
            # Write metadata.json
            with open(d / "metadata.json", "w") as f:
                json.dump(meta, f, indent=4)
                
            print(f"  -> Generated metadata.json for {d.name}")

if __name__ == "__main__":
    main()
