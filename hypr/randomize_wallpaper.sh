#!/usr/bin/env bash

if ! pgrep -x hyprpaper > /dev/null; then
    hyprpaper &
    sleep 1
fi

WALLPAPER_DIR="$HOME/Downloads/wallpapers/"

WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper ",$WALLPAPER"

wal -i "$WALLPAPER" -n # -n skips setting the wallpaper in terminals

WAL_COLORS="$HOME/.cache/wal/colors.json"

ACTIVE_BORDER_HEX=$(jq -r '.colors.color4' "$WAL_COLORS")
INACTIVE_BORDER_HEX=$(jq -r '.colors.color8' "$WAL_COLORS")

ACTIVE_BORDER="rgb(${ACTIVE_BORDER_HEX:1})"
INACTIVE_BORDER="rgb(${INACTIVE_BORDER_HEX:1})"

hyprctl keyword general:col.active_border "$ACTIVE_BORDER"
hyprctl keyword general:col.inactive_border "$INACTIVE_BORDER"

echo "Wallpaper and colors updated successfully!"
