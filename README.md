# MScThesisReportTemplate

A streamlined template for writing a Master's thesis report with including a scientific paper as one of its deliverables.
Based on TU Delft style, it provides a clear structure and ready-to-use functionalities to obtain a professional-looking report with minimal effort.

It makes use of the [LatexPreamble](https://github.com/CarmVarriale/LatexPreamble) repository to add custom commands and useful functionalities

## How to use

Clone this repository using the `--recurse-submodules` flag to include the [LatexPreamble](https://github.com/CarmVarriale/LatexPreamble) submodule, or download both repositories as `.zip` files and extract them in the appropriate folder structure:

```latex
git clone --recurse-submodules https://github.com/CarmVarriale/MScThesisReportTemplate.git MScThesisReport
```

Open the `main.tex` file and follow the instructions line by line.

## Building the document

This workspace is configured for use with the [LaTeX Workshop](https://marketplace.visualstudio.com/items?itemName=James-Yu.latex-workshop) VS Code extension.
Auto-build on save is disabled — you trigger builds manually using **recipes**.

### How to run a recipe

1. Open `main.tex` (or any `.tex` file in the project).
2. Open the LaTeX Workshop panel by clicking the **TeX** icon in the Activity Bar on the left.
3. Under **Build LaTeX project**, click **Recipe: \<name\>** to run a specific recipe, or press the green **▶ Build** button to run the default recipe.

Alternatively, use the Command Palette (`Ctrl+Shift+P`) and run **LaTeX Workshop: Build with recipe**, then select one from the list.

### Available recipes

| Recipe | When to use |
|---|---|
| `pdflatex` | Quick build — no bibliography or glossary. **Default.** |
| `pdflatex ➞ biber ➞ pdflatex × 2` | Full build with bibliography (BibLaTeX/Biber). |
| `pdflatex ➞ makeglossaries ➞ pdflatex × 2` | Full build with glossary entries. |
| `pdflatex ➞ makeglossaries ➞ biber ➞ pdflatex × 2` | Full build with both bibliography and glossary. |

> All build output is placed in the `.build/` subdirectory.

## Contributing

Feel free to open an issue or a pull request if you want to suggest improvements or report bugs. 
Keep in mind that style is subjective, but functionalities can be expanded and improved.

You are welcome to work on any open issue and submit a Pull Request to make this repository (or its submdodules) better for future users.

## License

This project is licensed under the BSD 3-Clause License - see the [LICENSE](LICENSE) file for details.
