#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info() { printf "\033[1;34m[INFO]\033[0m %s\n" "$*"; }
warn() { printf "\033[1;33m[WARN]\033[0m %s\n" "$*"; }
error() { printf "\033[1;31m[ERR]\033[0m  %s\n" "$*" >&2; }

link_file() {
  local src="$1"
  local dst="$2"

  if [ -L "$dst" ] || [ -f "$dst" ] || [ -d "$dst" ]; then
    if [ "$(readlink "$dst" 2>/dev/null)" = "$src" ]; then
      info "Already linked: $dst"
      return
    fi

    backup="${dst}.backup.$(date +%Y%m%d%H%M%S)"
    warn "Backing up existing $dst to $backup"
    mv "$dst" "$backup"
  fi

  ln -s "$src" "$dst"
  info "Linked $dst → $src"
}

install_home_files() {
  info "Linking home/ files and directories..."

  # Link all items directly under home/ (both files and directories)
  for item in "$DOTFILES_DIR/home"/*; do
    [ -e "$item" ] || continue
    name="$(basename "$item")"
    dst="$HOME/.${name}"
    link_file "$item" "$dst"
  done
}

install_bin() {
  info "Linking bin/ scripts..."
  mkdir -p "$HOME/bin"
  for file in "$DOTFILES_DIR/bin/"*; do
    [ -f "$file" ] || continue
    dst="$HOME/bin/$(basename "$file")"
    link_file "$file" "$dst"
  done
}

install_brew() {
  if ! command -v brew >/dev/null 2>&1; then
    info "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi

  if [ -f "$DOTFILES_DIR/Brewfile" ]; then
    info "Installing packages from Brewfile..."
    brew bundle --file="$DOTFILES_DIR/Brewfile"
  fi
}

apply_macos_defaults() {
  if [ -f "$DOTFILES_DIR/macos/defaults.sh" ]; then
    info "Applying macOS defaults..."
    bash "$DOTFILES_DIR/macos/defaults.sh"
  fi
}

install_deps() {
  # oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

  # Tmuxifier
  git clone https://github.com/jimeh/tmuxifier.git ~/.tmuxifier
}

main() {
  case "$(uname -s)" in
  Darwin) info "Detected macOS" ;;
  *) warn "Non-macOS system detected. Script may not behave as expected." ;;
  esac

  install_brew
  install_home_files
  install_bin
  apply_macos_defaults
  install_deps

  # Create empty hushlogin
  # Useful to remove "last login" information
  touch "$HOME/.hushlogin"

  info "Done! Restart your shell to pick up changes."
}

main "$@"
