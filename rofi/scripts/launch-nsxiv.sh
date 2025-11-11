#!/bin/bash

SEARCH_DIRS="$HOME/Pictures $HOME/Documents $HOME/Projects $HOME/Downloads $HOME/code"

selected_dir=$(find $SEARCH_DIRS -mindepth 1 -type d 2>/dev/null | rofi -dmenu -i -p "Select Image Directory")

if [ -n "$selected_dir" ]; then
    hyprctl dispatch exec "nsxiv -t \"$selected_dir\""
fi
