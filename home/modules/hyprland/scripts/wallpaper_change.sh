#!/usr/bin/env bash
export PATH="$PATH:/run/current-system/sw/bin:/etc/profiles/per-user/$USER/bin:$HOME/.nix-profile/bin"
wall_dir="$HOME/nixos-config/assets/wallpapers/"
cacheDir="$HOME/.cache/jp"
rofiCacheDir="$HOME/.cache/img-symbol"

if [ ! -d "$cacheDir" ]; then
    mkdir -p "$cacheDir"
fi

if [ ! -d "$rofiCacheDir" ]; then
    mkdir -p "$rofiCacheDir"
fi

for imagen in "$wall_dir"/*.{jpg,jpeg,png,webp,gif}; do
    if [ -f "$imagen" ]; then
        nombre_archivo=$(basename "$imagen")
        nombre_sin_extension="${nombre_archivo%.*}"
        if [ ! -f "$cacheDir/$nombre_sin_extension.png" ]; then
            magick "$imagen[0]" -strip -thumbnail 500x500^ -gravity center -extent 500x500 "$cacheDir/$nombre_sin_extension.png"
        fi
    fi
done

rofi_command="rofi -dmenu -show-icons -theme $HOME/.config/rofi/wall_select.rasi"

wall_selection=$(find "$wall_dir" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) \
    -printf "%f\n" | shuf |
    awk -v cache="$cacheDir" '{
        nombre = $0; 
        sub(/\.[^.]+$/, "", nombre); 
        printf "%s\x00icon\x1f%s/%s.png\n", $0, cache, nombre
    }' | $rofi_command)

[[ -n "$wall_selection" ]] || exit 1

wallpaper_path="$wall_dir/$wall_selection"
swww img "$wallpaper_path" --transition-step 10 --transition-fps 30 --transition-type center &

convert "$wallpaper_path" "$rofiCacheDir/current.png"

ln -sf "$rofiCacheDir/current.png" "$rofiCacheDir/current.wallpaper"

exit 0
