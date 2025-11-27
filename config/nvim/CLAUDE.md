# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Architecture Overview

This is a **LazyVim-based Neovim configuration** that follows LazyVim's modular architecture:

### Core Structure
- **Entry Point**: `init.lua` → `lua/config/lazy.lua` (bootstraps lazy.nvim and LazyVim)
- **Plugin Architecture**: Uses lazy.nvim for plugin management with LazyVim as the base distribution
- **Configuration Layers**:
  1. **LazyVim Base**: Imported via `{ "LazyVim/LazyVim", import = "lazyvim.plugins" }`
  2. **Custom Plugins**: Loaded from `lua/plugins/` directory (imported via `{ import = "plugins" }`)
  3. **Config Overrides**: `lua/config/` contains customizations to LazyVim defaults

### Plugin System
- **Plugin Loading**: All `.lua` files in `lua/plugins/` are automatically loaded
- **Plugin Configuration**: Each plugin file returns a table/array of plugin specifications
- **LazyVim Integration**: Custom plugins can override/extend LazyVim's default configurations

### Language Support (Configured Extras)
The `lazyvim.json` shows pre-configured language support for:
- C/C++ (`clangd`)
- Go
- JSON
- TOML  
- TypeScript
- VSCode integration

## Configuration Files

### Core Configuration (`lua/config/`)
- **`lazy.lua`**: Plugin manager bootstrap and LazyVim setup
- **`options.lua`**: Neovim options (currently inherits LazyVim defaults)
- **`keymaps.lua`**: Custom keybindings (currently inherits LazyVim defaults)  
- **`autocmds.lua`**: Auto-commands (currently inherits LazyVim defaults)

### Plugin Configuration (`lua/plugins/`)
- **`colorscheme.lua`**: Catppuccin theme configuration (custom)
- **`example.lua`**: Template file showing plugin configuration patterns (disabled by default)

### Code Style
- **`stylua.toml`**: Lua code formatting (2 spaces, 120 column width)

## Development Commands

### Plugin Management
```bash
# Open Neovim and run these commands:
:Lazy                    # Open lazy.nvim plugin manager UI
:Lazy sync              # Update/install all plugins
:Lazy clean             # Remove unused plugins
:Lazy profile           # Performance profiling
```

### Code Formatting
```bash
# Format Lua files using stylua
stylua lua/             # Format all Lua files in lua/ directory
stylua .                # Format all Lua files in current directory
```

### Configuration Testing
```bash
# Test configuration in isolation
nvim --noplugin         # Start without plugins
nvim -u NONE            # Start with minimal config
```

## Plugin Development Patterns

### Adding New Plugins
Create a new file in `lua/plugins/` with this structure:
```lua
return {
  {
    "author/plugin-name",
    opts = {
      -- plugin configuration
    },
  },
}
```

### Overriding LazyVim Plugins
To modify LazyVim's default plugin configurations:
```lua
return {
  {
    "plugin-name",
    opts = {
      -- your custom options (merged with defaults)
    },
  },
}
```

### Plugin Loading Strategy
- Custom plugins load during startup (`lazy = false` by default)
- LazyVim plugins are lazy-loaded automatically
- Plugin dependencies are managed automatically by lazy.nvim

## Theme Configuration

The configuration uses **Catppuccin** as the default colorscheme:
- Theme variant: `mocha` (dark)
- Location: `lua/plugins/colorscheme.lua`
- Integrations enabled for LazyVim plugins (cmp, gitsigns, treesitter, etc.)