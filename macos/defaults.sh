# Make mission control & window animations faster
defaults write com.apple.WindowManager EnableStandardClickToShowDesktop -bool false
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write -g NSAutomaticWindowAnimationsEnabled -bool false
defaults write -g QLPanelAnimationDuration -float 0
defaults write -g NSScrollAnimationEnabled -bool false

# Disable automatic rearrangement of Spaces
# AeroSpace manages spaces; macOS should NOT reorder them.
defaults write com.apple.dock mru-spaces -bool false

# Disable stage manager
defaults write com.apple.WindowManager EnableStageManager -bool false

# Prevent switching to another Space when switching app
defaults write NSGlobalDomain AppleSpacesSwitchOnActivate -bool false

# Show file extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Expand save/print panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# For some reason, mission control doesn’t like that AeroSpace puts a lot of windows in the bottom right corner of the screen. Mission control shows windows too small even when there is enough space to show them bigger.
# There is a workaround. You can enable Group windows by application setting:
defaults write com.apple.dock expose-group-apps -bool true && killall Dock

# If you don’t care about macOS native fullscreen in multi-monitor setup (which is itself clunky anyway, since it creates a separate Space instance), I recommend disabling Displays have separate Spaces.
# You can disable the setting by running:
defaults write com.apple.spaces spans-displays -bool true && killall SystemUIServer

# Disable Hot Corners
defaults write com.apple.dock wvous-tl-corner -int 0
defaults write com.apple.dock wvous-tl-modifier -int 0

defaults write com.apple.dock wvous-tr-corner -int 0
defaults write com.apple.dock wvous-tr-modifier -int 0

defaults write com.apple.dock wvous-bl-corner -int 0
defaults write com.apple.dock wvous-bl-modifier -int 0

defaults write com.apple.dock wvous-br-corner -int 0
defaults write com.apple.dock wvous-br-modifier -int 0

# Hide Dock completely
defaults write com.apple.dock autohide -bool true

# Remove hide/show animation delays for snappier behavior
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0

# Disable Dock bounce animation
defaults write com.apple.dock launchanim -bool false

# Do NOT show recent apps
defaults write com.apple.dock show-recents -bool false

# Auto-hide menu bar
defaults write NSGlobalDomain _HIHideMenuBar -bool true

# Kill Dock & Finder to apply defaults
killall Dock 2>/dev/null || true
killall Finder 2>/dev/null || true
