# Calculus I: Explanations, Problems & Solutions

**Author**: Sihoo Lee

This repository contains comprehensive notes for a Calculus I course, built using the [Noteworthy](https://github.com/sihooleebd/noteworthy) framework and [Typst](https://typst.app/). The notes differ from standard textbooks by offering a more intuitive, "preview-first" approach and utilizing clean, modern typography.

## Content Overview

The notes are structured to provide a deep understanding of the fundamental concepts of Calculus.

### [00] Preview of Calculus
-   **Concept**: Bridging pre-calculus and calculus.
-   **Key Topics**: The Tangent Problem, The Velocity Problem, and the introduction of the Limit.

### [01] Functions and Limits
-   **Concept**: Formalizing the limit and continuity.
-   **Key Topics**:
    -   The Tangent & Speed Problem
    -   The Limit of a Function
    -   Calculating Limits using Limit Laws
    -   The Precise Definition of a Limit (Epsilon-Delta)
    -   Continuity & The Intermediate Value Theorem

*...and more to come.*

## Building the Notes

To generate the PDF from these notes, you need to use the included build system.

### Prerequisites
-   **Typst CLI**: Make sure you have `typst` installed.
-   **Python 3**: Required for the build script.

### Instructions
1.  **Clone the repository**:
    ```bash
    git clone <repository-url>
    cd calculus_1
    ```
2.  **Build**:
    Run the `noteworthy.py` script to enter the build menu:
    ```bash
    python3 noteworthy.py
    ```
    Select **Build** -> **Full Build** to generate `output.pdf`.

## Features
-   **High-Quality Typesetting**: Powered by Typst.
-   **Visual Graphs**: Integrated plots using Cetz.
-   **Structured Layout**: Definitions, Theorems, and Proofs are clearly distinguished.
