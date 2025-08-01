#!/usr/bin/env bash
export PATH="$PATH:/run/current-system/sw/bin:/etc/profiles/per-user/$USER/bin:$HOME/.nix-profile/bin"
wall_dir="$HOME/nixos-config/assets/wallpapers/"
cacheDir="$HOME/.cache/jp/"

if [ ! -d "$cacheDir" ]; then
    mkdir -p "$cacheDir"
fi

for imagen in "$wall_dir"/*.{jpg,jpeg,png,webp,gif}; do
    if [ -f "$imagen" ]; then
        nombre_archivo=$(basename "$imagen")
        if [ ! -f "$cacheDir/$nombre_archivo" ]; then
            magick "$imagen" -strip -thumbnail 500x500^ -gravity center -extent 500x500 "$cacheDir/$nombre_archivo"
        fi
    fi
done

rofi_command="rofi -dmenu -theme $HOME/.config/rofi/wall_select.rasi"

wall_selection=$(find "$wall_dir" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) \
    -printf "%f\n" | shuf | awk -v cache="$cacheDir" '{printf "%s\x00icon\x1f%s/%s\n", $0, cache, $0}' | $rofi_command)

[[ -n "$wall_selection" ]] || exit 1
swww img "$wall_dir/$wall_selection" --transition-step 10 --transition-fps 30 --transition-type center &
wallpaper_path="$wall_dir/$wall_selection"
mkdir -p ~/.cache/img-symbol
ln -sf "$wallpaper_path" ~/.cache/img-symbol/current.wallpaper
exit 0
