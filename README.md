# The Bread Code Downloads

This repository contains all the public downloads from [The Bread Code](https://downloads.the-bread-code.io/), including:

## The Sourdough Framework
- **The Sourdough Framework** - Complete guide to sourdough bread making
- **The Sourdough Framework Recipes** - Collection of sourdough recipes

## Available Formats
- PDF (standard and sans-serif versions)
- EPUB (standard and black & white versions)
- Print-ready PDFs for physical printing

## Direct Downloads

### The Sourdough Framework
- [TheBreadCode-The-Sourdough-Framework.pdf](https://downloads.the-bread-code.io/the-sourdough-framework/TheBreadCode-The-Sourdough-Framework.pdf) - Standard PDF version
- [TheBreadCode-The-Sourdough-Framework-sans-serif.pdf](https://downloads.the-bread-code.io/the-sourdough-framework/TheBreadCode-The-Sourdough-Framework-sans-serif.pdf) - Sans-serif PDF version
- [TheBreadCode-The-Sourdough-Framework.epub](https://downloads.the-bread-code.io/the-sourdough-framework/TheBreadCode-The-Sourdough-Framework.epub) - Standard EPUB version
- [TheBreadCode-The-Sourdough-Framework-black-and-white.epub](https://downloads.the-bread-code.io/the-sourdough-framework/TheBreadCode-The-Sourdough-Framework-black-and-white.epub) - Black & white EPUB version
- [TheBreadCode-The-Sourdough-Framework-tldr-digital.pdf](https://downloads.the-bread-code.io/the-sourdough-framework/TheBreadCode-The-Sourdough-Framework-tldr-digital.pdf) - TL;DR digital version
- [TheBreadCode-The-Sourdough-Framework-tldr-print.pdf](https://downloads.the-bread-code.io/the-sourdough-framework/TheBreadCode-The-Sourdough-Framework-tldr-print.pdf) - TL;DR print version

### The Sourdough Framework Recipes
- [TheBreadCode-The-Sourdough-Framework-Recipes.pdf](https://downloads.the-bread-code.io/the-sourdough-framework-recipes/TheBreadCode-The-Sourdough-Framework-Recipes.pdf) - Standard PDF version
- [TheBreadCode-The-Sourdough-Framework-recipes-sans-serif.pdf](https://downloads.the-bread-code.io/the-sourdough-framework-recipes/TheBreadCode-The-Sourdough-Framework-recipes-sans-serif.pdf) - Sans-serif PDF version
- [TheBreadCode-The-Sourdough-Framework-Recipes.epub](https://downloads.the-bread-code.io/the-sourdough-framework-recipes/TheBreadCode-The-Sourdough-Framework-Recipes.epub) - Standard EPUB version
- [TheBreadCode-The-Sourdough-Framework-Recipes-black-and-white.epub](https://downloads.the-bread-code.io/the-sourdough-framework-recipes/TheBreadCode-The-Sourdough-Framework-Recipes-black-and-white.epub) - Black & white EPUB version

## About The Sourdough Framework

The Sourdough Framework is an open-source book dedicated to helping you make the best possible sourdough bread at home. Rather than providing recipes, this book provides a framework that enables you to bake bread in your respective environment. Every flour, every sourdough, and every home setup is different.

For more details about the project, visit the official repository: [hendricius/the-sourdough-framework](https://github.com/hendricius/the-sourdough-framework)

You can also read the book online at: [the-sourdough-framework.com](https://www.the-sourdough-framework.com)

## Updating the downloads

The book is built in CI in the
[the-sourdough-framework](https://github.com/hendricius/the-sourdough-framework)
repository. To publish a new version you pull the latest built files into this
repo and push — that redeploys downloads.the-bread-code.io automatically.

### Prerequisites

1. **Git LFS** (the PDFs/EPUBs are stored via LFS):
   ```bash
   # macOS (Homebrew) / Ubuntu (apt) / Windows (Chocolatey)
   brew install git-lfs   # or: sudo apt install git-lfs   # or: choco install git-lfs
   git lfs install
   ```

2. **GitHub CLI** (`gh`), authenticated:
   ```bash
   brew install gh        # or your platform's package manager
   gh auth login
   ```

### Publish a release

Fetch the newest CI-built PDFs/EPUBs and commit them:

```bash
make release
```

This downloads the latest successful build's artifacts from the framework
repository, copies them into `the-sourdough-framework/`, shows you the changes,
and — after you confirm — commits and pushes. The hardcover and TL;DR PDFs are
maintained separately and left untouched.

If you've built the book locally instead (`make bake` in a checkout of the
framework repo), copy straight from there:

```bash
make release-local                              # reads ../the-sourdough-framework/book/release
# or point at a specific checkout:
./bin/release.sh --local /path/to/the-sourdough-framework
```

## License

This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0), just like the original [The Sourdough Framework](https://github.com/hendricius/the-sourdough-framework) project.
