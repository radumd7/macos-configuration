#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

# Source colors
source "$CONFIG_DIR/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME background.color=$ACCENT_COLOR icon.color=$BASE label.color=$BASE label.shadow.drawing=off icon.shadow.drawing=off background.border_width=1
else
  sketchybar --set $NAME background.color=$ITEM_BG_COLOR icon.color=$ICON_COLOR label.color=$LABEL_COLOR label.shadow.drawing=off icon.shadow.drawing=off background.border_width=0
fi
