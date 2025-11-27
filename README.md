# MacOS Configuration

Personal macOS development environment configuration with tiling window management, modern terminal setup, and optimized development tools.

## What You Get

### Window Management & Desktop

- **AeroSpace** - Tiling window manager for macOS with i3-like keybindings
- **SketchyBar** - Customizable macOS status bar replacement
- **Optimized macOS defaults** - Disabled animations, hidden dock/menubar, and productivity-focused settings

### Terminal & Shell

- **Ghostty** - Modern, GPU-accelerated terminal emulator
- **Tmux** - Terminal multiplexer with sensible defaults and TPM plugin manager
- **Oh My Zsh** - Enhanced Zsh with Powerlevel10k theme
- **zsh-syntax-highlighting** - Command syntax highlighting
- **zoxide** - Smarter cd command with fuzzy matching

### Editors

- **Neovim** - Modern vim-based editor with full configuration
- **Zed** - High-performance code editor
- **VS Code** - Preconfigured with extensions for Go, JavaScript/TypeScript, Docker, and more

### Development Tools

**General utilities:**

- fd - Fast find alternative
- fzf - Fuzzy finder
- ripgrep - Fast grep alternative
- jq - JSON processor
- yazi - Terminal file manager
- gh - GitHub CLI
- watchman - File watcher

**Languages & frameworks:**

- Go toolchain (gopls, delve, air, staticcheck, gotests)
- Rust analyzer
- CocoaPods (iOS development)

**Media & graphics:**

- ffmpeg - Video processing
- imagemagick - Image manipulation
- poppler - PDF utilities
- resvg - SVG renderer

**Fonts:**

- Hack Nerd Font
- SketchyBar App Font
- Symbols Only Nerd Font

Note: SF Pro font must be installed manually from [Apple Developer](https://developer.apple.com/fonts/)

## Installation

### Prerequisites

- macOS (tested on recent versions)
- Admin privileges for Homebrew installation
- **SF Pro Font** - Download and install manually from [Apple Developer](https://developer.apple.com/fonts/)

### Quick Install

```bash
git clone https://github.com/radumd7/dotfiles.git ~/dotfiles
cd ~/dotfiles
./install.sh
```

The installer will:

1. Install Homebrew (if not present)
2. Install all packages, applications, and fonts from `Brewfile`
3. Symlink configuration files to appropriate locations
4. Apply macOS system defaults
5. Install Oh My Zsh, Tmuxifier, and tmux plugins (TPM, tmux-sensible, catppuccin)

### What Gets Linked

**Home directory** (`home/` → `~/.*`)

Each file or directory in `home/` gets symlinked to your home directory with a dot prefix:

- `home/aerospace.toml` → `~/.aerospace.toml` - AeroSpace window manager config
- `home/tmux.conf` → `~/.tmux.conf` - Tmux configuration
- `home/tmux/` → `~/.tmux/` - Tmux plugins directory
- `home/wezterm.lua` → `~/.wezterm.lua` - WezTerm config
- `home/zshrc` → `~/.zshrc` - Zsh configuration

**Config directory** (`config/` → `~/.config/`)

Each subdirectory gets symlinked individually:

- `config/ghostty/` → `~/.config/ghostty/` - Ghostty terminal settings
- `config/nvim/` → `~/.config/nvim/` - Neovim configuration
- `config/sketchybar/` → `~/.config/sketchybar/` - SketchyBar setup
- `config/tmux/` → `~/.config/tmux/` - Tmux plugin configs
- `config/zed/` → `~/.config/zed/` - Zed editor settings

**Bin directory** (`bin/` → `~/bin/`)

- Custom scripts and utilities

## Customization

### Backup Safety

All existing files are backed up before being replaced. Backups are timestamped:

```
~/.gitconfig ? ~/.gitconfig.backup.20250127123456
```

### Modifying Configurations

Since files are symlinked, you can edit them in the `~/dotfiles` directory and changes take effect immediately (or after reloading the relevant application).

### Adding More Packages

Edit `Brewfile` and run:

```bash
brew bundle --file=~/dotfiles/Brewfile
```

### macOS Defaults

Modify `macos/defaults.sh` to customize system settings. Run manually:

```bash
bash ~/dotfiles/macos/defaults.sh
```

## Key Features

### AeroSpace Window Management

- Automatic tiling with i3-style keybindings
- Multi-monitor support
- Workspace management

### Performance Optimizations

- Disabled macOS window animations
- Fast mission control switching
- Displays span multiple monitors (no separate Spaces)
- Auto-hiding dock and menubar

### Development Workflow

- Integrated terminal multiplexing with tmux
- Modern fuzzy finding and navigation
- Full language server support for Go, Rust, and more
- Git integration with GitHub CLI

## Post-Install

1. **Restart your shell** or open a new terminal window
2. Configure Powerlevel10k (first launch will prompt you)
3. **Start tmux** - All plugins are pre-installed and will load automatically:
   - TPM (Tmux Plugin Manager)
   - tmux-sensible (sensible defaults)
   - catppuccin (theme)
4. Review AeroSpace keybindings in `~/.aerospace.toml`
5. Customize SketchyBar in `~/.config/sketchybar/`

## Troubleshooting

- If Oh My Zsh installation fails, check `~/.zshrc` and manually run the installer
- For Homebrew issues, ensure Xcode Command Line Tools are installed: `xcode-select --install`
- macOS defaults may require logout/login to fully apply
- Check symlinks with `ls -la ~` and `ls -la ~/.config`

## License

Personal configuration - use at your own discretion.
