# Calculus I: Explanations, Problems & Solutions

Welcome to the central repository for the Calculus I project. This comprehensive set of notes is built using the [Noteworthy](https://github.com/sihooleebd/noteworthy) framework and Typst, offering an intuitive, "preview-first" approach to mastering Calculus based on Stewart Calculus.

The project is currently split into two dedicated developer tracks:

## Project Branches

- [Explore Lee Sihoo's Track (shlee)](https://github.com/sihooleebd/calculus-1/tree/shlee)
  - Contains chapters 0 to 7 modernized for the updated Typst environment, complete build scripts, and compiled output.pdf.
- [Explore Lee Hojun's Track (hjlee)](https://github.com/sihooleebd/calculus-1/tree/hjlee)
  - Contains tracks and developments by Hojun Lee.

## Local Setup & Workflow

To work with this repository on your local machine, clone it and switch to your desired branch:

```bash
# Clone the repository
git clone https://github.com/sihooleebd/calculus-1.git
cd calculus-1

# Check out Sihoo's branch
git checkout shlee

# Or check out Hojun's branch
git checkout hjlee
```

### Building the Notes
To generate the final PDF:
1. Ensure you have the Typst CLI and Python 3 installed.
2. Run the build script menu:
   ```bash
   python3 noteworthy.py
   ```
3. Select Build -> Full Build to generate the document.
