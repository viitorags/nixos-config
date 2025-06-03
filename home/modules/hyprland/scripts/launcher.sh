#!/usr/bin/env bash
wallpaper_path=$(swww query | sed -n 's/.*currently displaying: image: \(.*\)/\1/p')
GDK_BACKEND=x11 /run/current-system/sw/bin/dbeaver "$@"
# Chama o rofi com o wallpaper e aplica o comando direto para dbeaver
rofi -show drun \
  -theme ~/.config/rofi/config.rasi \
  -theme-str "imagebox { background-image: url(\"$wallpaper_path\", height);}"
