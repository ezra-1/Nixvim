# Ezra's NixVim Configuration

A modern, modular, and minimal Neovim setup powered by Nix, built with:

* Nix Flakes
* NixVim
* Modular plugin structure
* Catppuccin Mocha theme
* Fast startup and workflow-focused tooling
* LSP, DAP, Treesitter, Git, and terminal integrations

---

# Features

## Development

* Multi-language LSP support
* Auto formatting with Conform.nvim
* Debugging with nvim-dap
* Snippets + autocompletion with nvim-cmp
* Treesitter syntax highlighting & textobjects
* Git integration with Gitsigns + Neogit

## UI

* Catppuccin theme
* Transparent background support
* Lualine statusline
* Bufferline tabs
* Noice UI enhancements
* Which-Key command hints
* Snacks dashboard & explorer

## Workflow

* ToggleTerm integration
* zellij navigation
* Persistent sessions
* Fast fuzzy finding
* Modern keymaps

---

# Included Plugins

## Core

* persistence.nvim
* direnv.nvim
* better-escape.nvim
* nvim-autopairs
* web-devicons

## Editing

* Treesitter
* Comment.nvim
* Flash.nvim
* Hop.nvim
* UFO folding

## Completion

* nvim-cmp
* LuaSnip
* cmp-nvim-lsp
* cmp-buffer
* cmp-path

## LSP & Formatting

* nvim-lspconfig
* conform.nvim
* lazydev.nvim
* lint.nvim

## Debugging

* nvim-dap
* dap-ui
* dap-python
* dap-go
* nvim-dap-virtual-text

## Git

* gitsigns.nvim
* neogit

## UI

* lualine.nvim
* bufferline.nvim
* noice.nvim
* transparent.nvim
* which-key.nvim
* snacks.nvim

---

# Structure

```text
.
├── flake.nix
├── config
│   ├── core
│   ├── plugins
│   └── theme
└── README.md
```

---

# Installation

## Clone Repository

```bash
git clone https://github.com/ezra-1/nixvim.git
cd nixvim
```

## Run Neovim

```bash
nix run .
```

## Check Configuration

```bash
nix flake check
```

---

# Requirements

* Nix with flakes enabled
* Neovim compatible terminal
* Nerd Font installed
* Git

Optional:

* zellij
* direnv

---

# Keymaps

## General

| Key         | Action                 |
| ----------- | ---------------------- |
| `<leader>w` | Save file              |
| `<leader>q` | Quit                   |
| `<leader>h` | Clear search highlight |
| `<leader>v` | Vertical split         |

## Buffers

| Key          | Action              |
| ------------ | ------------------- |
| `<S-l>`      | Next buffer         |
| `<S-h>`      | Previous buffer     |
| `<leader>bo` | Close other buffers |
| `<leader>bp` | Toggle pin          |

## Git

| Key          | Action       |
| ------------ | ------------ |
| `<leader>gg` | Open Neogit  |
| `<leader>gs` | Stage hunk   |
| `<leader>gr` | Reset hunk   |
| `<leader>gp` | Preview hunk |

## Debugging

| Key      | Action         |
| -------- | -------------- |
| `<F5>`   | Start/Continue |
| `<S-F5>` | Stop           |
| `<F10>`  | Step over      |
| `<F11>`  | Step into      |
| `<F12>`  | Step out       |

---

# Theme

Theme: Catppuccin Mocha

Features:

* Transparent background
* LSP styling
* Treesitter integration
* Telescope styling
* Bufferline integration
* Which-Key integration

---

# Supported Languages

* Lua
* Rust
* Nix
* Bash
* Python
* TypeScript
* JavaScript
* C / C++
* C#
* Go
* JSON
* YAML
* Markdown
* Zig

---

# License

MIT License
