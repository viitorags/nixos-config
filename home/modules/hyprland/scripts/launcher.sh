#!/usr/bin/env bash
wallpaper_path=$(swww query | sed -n 's/.*currently displaying: image: \(.*\)/\1/p')
rofi -show drun -font "Fantasque Sans Mono Regular 15" \
    -theme ~/.config/rofi/launcher.rasi
# -theme-str "imagebox { background-image: url(\"$wallpaper_path\", height);}"
