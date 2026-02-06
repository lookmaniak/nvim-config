# My Favorite Neovim Web Dev Config (LazyVim + Lazy.nvim)

A **minimal, fast, and powerful Neovim configuration** optimized for **modern web development** using **Lazy.nvim** and **LazyVim** as the foundation.  
Designed for **JavaScript / TypeScript / PHP / Tailwind / JSON** workflows with **LSP, formatting, linting, and AI coding assistance**, working seamlessly on **macOS and Windows**.

---

## Features

- Fast startup using **Lazy.nvim**
- Smart defaults powered by **LazyVim**
- Optimized for **Web Development**
- AI coding assistance via **GitHub Copilot**
- Full LSP support for:
  - JavaScript / TypeScript
  - PHP (Intelephense)
  - HTML
  - CSS / SCSS
  - Tailwind CSS
  - JSON
- Auto-formatting + linting:
  - ESLint
  - Prettier
  - PHP-CS-Fixer
  - PHPCS
- Clean UI with curated colorscheme
- Efficient window & tab navigation
- Modular and easy-to-extend structure
- Works on **macOS & Windows**

---

## Requirements

### Neovim
```bash
>= 0.9.0 (recommended 0.10+)
```

### Common Dependencies (All OS)

| Tool | Purpose |
|------|---------|
| git | Plugin management |
| node | LSP, linting, formatting |
| npm / pnpm / yarn | JS tooling |
| php | PHP development |
| composer | PHP tooling |
| ripgrep | Telescope search |
| fd | Fast file finder |

---

## Windows Setup (IMPORTANT)

**Windows users MUST install additional components, or Neovim will fail to install plugins properly.**

This config uses:
- Treesitter (native compilation)
- LSP servers
- null-ls
- Node-based tooling
- Copilot

Which requires **native build tools**.

---

### Microsoft Visual C++ Build Tools (REQUIRED)

This is the **#1 missing dependency on Windows**.  
Without it, you will get errors like:

```yaml
error MSB8020: The build tools for v143 cannot be found
nvim-treesitter: compilation failed
cc: command not found
```

**Install:**  
[https://visualstudio.microsoft.com/visual-cpp-build-tools/](https://visualstudio.microsoft.com/visual-cpp-build-tools/)

Select: **Desktop development with C++**  
Make sure these are checked:
- MSVC v143 build tools
- Windows 10 / 11 SDK
- CMake tools for Windows

---

### Node.js (REQUIRED)

Used by:
- LSP servers
- ESLint
- Prettier
- Copilot
- Treesitter builds

[https://nodejs.org/](https://nodejs.org/)  
Install **LTS version**

Verify:
```powershell
node -v
npm -v
```

---

### Python + pynvim (RECOMMENDED)

Some plugins require Python support.  
[https://www.python.org/downloads/windows/](https://www.python.org/downloads/windows/)

During install:  
- Check **Add Python to PATH**

Then run:
```powershell
pip install pynvim
```

---

### Git for Windows (REQUIRED)

[https://git-scm.com/download/win](https://git-scm.com/download/win)

Verify:
```powershell
git --version
```

---

### Optional But Highly Recommended Tools

| Tool | Purpose |
|------|---------|
| ripgrep | Fast search |
| fd | Fast file search |

- [ripgrep releases](https://github.com/BurntSushi/ripgrep/releases)  
- [fd releases](https://github.com/sharkdp/fd/releases)

Verify:
```powershell
rg --version
fd --version
```

---

### Recommended Windows Install Order

```text
1. Git
2. Node.js
3. Python + pynvim
4. Visual C++ Build Tools
5. ripgrep + fd
6. Neovim
7. This config
```

---

## Installation

### macOS / Linux
```bash
mv ~/.config/nvim ~/.config/nvim.bak
git clone https://github.com/YOUR_USERNAME/YOUR_REPO ~/.config/nvim
nvim
```

### Windows (PowerShell)
```powershell
Rename-Item $env:LOCALAPPDATA\nvim nvim.bak
git clone https://github.com/YOUR_USERNAME/YOUR_REPO $env:LOCALAPPDATA\nvim
nvim
```

Lazy.nvim will automatically install all plugins on first launch.

---

## Architecture Overview

```swift
.
├── init.lua
└── lua
    ├── config
    │   ├── lazy.lua
    │   ├── keymaps.lua
    │   └── options.lua
    └── plugins
        ├── colorscheme.lua
        └── lsp.lua
```

### Design Principles
- Minimal overrides
- Maximum performance
- Modular design
- Easy extension
- Cross-platform reliability

---

## Plugin Stack

Powered by:
- lazy.nvim
- LazyVim

### Language Support

| Language | LSP |
|----------|-----|
| JavaScript / TypeScript | tsserver |
| PHP | intelephense |
| HTML | html |
| CSS / SCSS | cssls |
| Tailwind CSS | tailwindcss |
| JSON | jsonls |

---

## Formatting & Linting

### JavaScript / TypeScript
- ESLint
- Prettier

### PHP
- PHP-CS-Fixer
- PHPCS

Format buffer:
```vim
<leader>cf
```

---

## AI Assistance

Powered by:
- GitHub Copilot

Enable:
```vim
:Copilot setup
```

---

## Custom Keymaps

### Window Management

| Key | Action |
|-----|--------|
| ss | Horizontal split |
| sv | Vertical split |
| sh | Move left |
| sk | Move up |
| sj | Move down |
| sl | Move right |

### Tab Navigation

| Key | Action |
|-----|--------|
| te | New tab |
| Tab | Next tab |
| Shift+Tab | Previous tab |

---

## Performance Optimizations

Disabled default runtime plugins:
- gzip
- tarPlugin
- tutor
- tohtml
- zipPlugin

Result:
- Faster startup
- Lower memory usage

---

## Updating Plugins

```vim
:Lazy update
```

---

## Customization

Add plugins:
```bash
lua/plugins/
```

Override behavior:
```arduino
lua/config/
```

---

## Troubleshooting

### Treesitter build failure?
→ Install **Microsoft C++ Build Tools**

### LSP not running?
```vim
:LspInfo
```

### Formatting not working?
```bash
npm i -g eslint prettier
composer global require friendsofphp/php-cs-fixer squizlabs/php_codesniffer
```

---

## Contributing

PRs welcome!

---

## License

MIT

---
