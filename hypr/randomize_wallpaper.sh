#!/usr/bin/env bash

pkill hyprpaper

hyprpaper &

while ! hyprctl hyprpaper listloaded >/dev/null 2>&1; do
    echo "Waiting for hyprpaper..."
    sleep 0.5
done

WALLPAPER_DIR="$HOME/Downloads/wallpapers/"
WALLPAPER=$(find "$WALLPAPER_DIR" -type f | shuf -n 1)

hyprctl hyprpaper unload all
hyprctl hyprpaper preload "$WALLPAPER"
hyprctl hyprpaper wallpaper ",$WALLPAPER"

wal -i "$WALLPAPER" -n 
 matugen image "$WALLPAPER"

WAL_COLORS="$HOME/.cache/wal/colors.json"

ACTIVE_BORDER_HEX=$(jq -r '.colors.color4' "$WAL_COLORS")
INACTIVE_BORDER_HEX=$(jq -r '.colors.color8' "$WAL_COLORS")

ACTIVE_BORDER="rgb(${ACTIVE_BORDER_HEX:1})"
INACTIVE_BORDER="rgb(${INACTIVE_BORDER_HEX:1})"

hyprctl keyword general:col.active_border "$ACTIVE_BORDER"
hyprctl keyword general:col.inactive_border "$INACTIVE_BORDER"

killall waybar
waybar &
disown

echo "Wallpaper and colors updated successfully!"
