# Installation Guide

## Prerequisites

To use this CV template, you need:

1. A working LaTeX distribution (e.g., TeX Live, MiKTeX)
2. The following LaTeX packages:
   - fontawesome5
   - xcolor
   - hyperref
   - geometry
   - enumitem
   - calc
   - graphicx
   - fancyhdr
   - microtype
   - biblatex (with biber backend)
   - biber (for bibliography processing)

3. For publications support:
   - A working BibTeX/BibLaTeX installation
   - The biber backend (required for advanced bibliography features)

## Installation Steps

1. Clone this repository:

   ```bash
   git clone https://github.com/yourusername/awesomeCV.git
   ```

2. Copy the `src/awesomeCV.cls` file to your LaTeX project directory or install it system-wide:
   - **Local Installation**: Copy to your project directory
   - **System-wide Installation**: Copy to your LaTeX distribution's class directory

3. Install required packages:
   - For TeX Live:

     ```bash
     tlmgr install fontawesome5 enumitem biblatex biber
     ```

   Note: Some systems may require installing biber separately through the system package manager:
   - Ubuntu/Debian: `sudo apt-get install biber`
   - macOS (Homebrew): `brew install biber`

   - For MiKTeX: Use the package manager to install required packages

## Verifying Installation

1. Copy one of the example templates from the `examples` directory
2. Compile using your preferred LaTeX compiler:

   ```bash
   pdflatex your-cv.tex
   ```

## Troubleshooting

Common issues and their solutions:

1. **Missing Packages**:
   - Error: "File 'fontawesome5.sty' not found"
   - Solution: Install the fontawesome5 package using your package manager

2. **Compilation Errors**:
   - Ensure all required packages are installed
   - Check for syntax errors in your .tex file
   - Try cleaning temporary files and recompiling

For more help, please open an issue on the GitHub repository.
