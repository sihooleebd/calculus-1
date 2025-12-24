# Contributing to Calculus I Notes

We welcome contributions to improve these notes, whether it's fixing typos, improving explanations, or adding new problems.

## Workflow

1.  **Use the TUI**: The easiest way to manage content is via the `noteworthy.py` script.
    -   Use the **Hierarchy** menu to add new Chapters or Pages.
    -   This ensures `hierarchy.json` is updated correctly.
2.  **Edit Content**: Once a page is created, you can edit the generated `.typ` file in `content/`.

## Style Guide

### Mathematics
We use standard Typst math syntax with some project-specific conventions:
-   **Display Mode**: Use `$ ... $` with spaces for display equations.
-   **Inline Mode**: Use `$ ... $` without spaces for inline math.
-   **Environments**:
    -   `#definition[Title][Content...]`
    -   `#theorem[Title][Content...]`
    -   `#proof[Content...]`
    -   `#example[Content...]`

### Typography
-   Use **bold** for emphasis, not italics.
-   Keep sentences concise.
-   Use the `#note[...]` block for side remarks or warnings.

### Plotting
For graphs, use the wrappers provided in `templates/templater.typ`.
-   **Standard Function**: `#rect-plot(f: x => x^2)`
-   **Polar**: `#polar-plot(f: theta => 1 + calc.cos(theta))`

## Submitting Changes
Please ensure your build compiles without errors before pushing. Run a full build via `noteworthy.py` to verify.
