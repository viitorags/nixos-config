#!/usr/bin/env bash

wallpaper_path=$(swww query | sed -n 's/.*currently displaying: image: \(.*\)/\1/p')

selected=$(
    cliphist list -t |
        rofi -modi clipboard:~/nixos-config/home/modules/hyprland/scripts/cliphist-rofi-img -show clipboard -show-icons -font "Fantasque Sans Mono Regular 15" -theme ~/.config/rofi/launcher.rasi
    # -theme-str "inputbar { background-image: url(\"$wallpaper_path\", height); }"
)
