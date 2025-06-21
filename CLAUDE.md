# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

CheezyVim is a declarative NeoVim configuration built with **NixVim**, written in **Nix** with Lua extensions. It's a complete IDE-like experience that uses Nix flakes for reproducible builds across Linux and macOS.

## Common Commands

```bash
# Try the configuration without installing
nix run github:serpent213/CheezyVim

# Build the configuration
nix build

# Validate configuration
nix flake check

# Update dependencies
nix flake update
```

## Architecture Overview

### Core Structure
- **`flake.nix`** - Main flake definition, system configurations, and package exports
- **`config/`** - Modular NeoVim configuration directory
  - **`default.nix`** - Imports all configuration modules
  - **`options.nix`** - Core Vim settings and options
  - **`lsp/`** - Language Server Protocol configurations
  - **`plugins/`** - Plugin-specific configurations
  - **`keymaps/`** - Key binding definitions
  - **`ui/`** - UI components (telescope, lualine, etc.)
  - **`ai/`** - AI integrations (Avante, Copilot)
  - **`treesitter/`** - Syntax highlighting configuration

### Extension Pattern
Users can extend CheezyVim without forking using the `nixvimExtend` function:
```nix
pkgs.cheezyvim.nixvimExtend {
  options = { textwidth = 120; };
  config = {
    keymaps = [/* custom keymaps */];
    plugins = {/* additional plugins */};
  };
}
```

## Key Features

### Language Server Support
Built-in LSPs for: Nix, Go, Python (pylsp + pyright), TypeScript, HTML/CSS, Tailwind, Elixir, JSON/YAML, Docker, Bash, Lua, Markdown.

### Custom Keybindings
- **`,,`** - LSP rename symbol under cursor
- **`,b`** - Peek definition
- **`,B`** - Jump to definition OR find usages (intelligent toggle)
- **`<C-t>`** - Terminal toggle
- **`<Space>e`** - File tree toggle (auto-focuses current file)
- **`<Space>s`** - Live grep search
- **`<Space>f`** - Git file search

### AI Integration
- **Avante** - OpenAI o3-mini integration for code assistance
- **GitHub Copilot** - Code completion

## Development Notes

- All configuration is declarative through Nix expressions
- No traditional package managers - everything managed via Nix flakes
- Modular design allows easy feature addition/removal
- Auto-updating via GitHub Actions (daily `flake.lock` updates)
- Multi-platform support (Linux x86_64/aarch64, macOS x86_64/aarch64)

## Runtime Dependencies
Core tools (managed by Nix): `fd`, `ripgrep`, `gnused` (macOS only)