#!/usr/bin/env bash

# Obtém o caminho do wallpaper atual para usar como background do rofi
wallpaper_path=$(swww query | sed -n 's/.*currently displaying: image: \(.*\)/\1/p')

# Mostra a lista com MIME types, e o usuário escolhe um item
selected=$(cliphist list -t | \
rofi -modi clipboard:~/nixos-config/home/modules/hyprland/scripts/cliphist-rofi-img -show clipboard -show-icons\
    -theme ~/.config/rofi/config.rasi \
    # -theme-str "inputbar { background-image: url(\"$wallpaper_path\", height); }"
)
