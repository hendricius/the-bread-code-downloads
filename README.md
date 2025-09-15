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

## Setup

1. Install Git LFS (required for handling large files):
   ```bash
   # macOS (using Homebrew)
   brew install git-lfs
   
   # Ubuntu/Debian
   sudo apt install git-lfs
   
   # Windows (using Chocolatey)
   choco install git-lfs
   ```

2. Initialize Git LFS in the repository:
   ```bash
   git lfs install
   ```

3. Copy the environment template:
   ```bash
   cp .env.example .env
   ```

4. Edit `.env` with your server details:
   ```
   SSH_USER=bread
   SSH_HOST=your-server-ip-or-hostname
   ```

## Usage

### Test SSH connection
```bash
make test-ssh
```

### Download files from server
```bash
make download
```

### Upload files to server
```bash
make upload
```

## License

This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License (CC BY-SA 4.0), just like the original [The Sourdough Framework](https://github.com/hendricius/the-sourdough-framework) project.
