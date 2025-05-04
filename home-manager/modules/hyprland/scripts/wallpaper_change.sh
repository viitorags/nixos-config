#!/usr/bin/env bash
  export PATH="$PATH:/run/current-system/sw/bin:/etc/profiles/per-user/$USER/bin:$HOME/.nix-profile/bin"
  echo "$PATH" > /tmp/wallpaper_script_path.log
  # Set some variables
  wall_dir="$HOME/Wallpapers/"
  cacheDir="$HOME/.cache/jp/"

  # Create cache dir if not exists
  if [ ! -d "$cacheDir" ]; then
    mkdir -p "$cacheDir"
  fi

  physical_monitor_size=24
  monitor_res=$(hyprctl monitors | grep -A2 Monitor | head -n 2 | awk '{print $1}' | grep -oE '^[0-9]+')
  dotsperinch=$(echo "scale=2; $monitor_res / $physical_monitor_size" | bc | xargs printf "%.0f")
  monitor_res=$(($monitor_res * $physical_monitor_size / $dotsperinch))

  rofi_command="rofi -wayland -dmenu -theme $HOME/.config/rofi/wall_select.rasi -theme-str $rofi_override"

  # Enable nullglob to ensure that the wildcard pattern expands to an empty list if no matches are found
  shopt -s nullglob

  # Convert images in directory and save to cache dir
  for imagen in "$wall_dir"/*.{jpg,jpeg,png,webp}; do
    if [ -f "$imagen" ]; then
      nombre_archivo=$(basename "$imagen")
      if [ ! -f "$cacheDir/$nombre_archivo" ]; then
        magick "$imagen" -strip -thumbnail 400x500^ -gravity center -extent 400x500 "$cacheDir/$nombre_archivo"
      fi
    fi
  done

  # Select a picture with rofi
  wall_selection=$(find "$wall_dir" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.webp" -o -iname "*.gif" \) -exec basename {} \; | shuf | while read -r A; do echo -en "$A\x00icon\x1f""$cacheDir"/"$A\n"; done | $rofi_command)

  # Set the wallpaper
  [[ -n "$wall_selection" ]] || exit 1
  swww img $wall_dir/$wall_selection --transition-step 10 --transition-fps 30 --transition-type center &
	wallpaper_path="$wall_dir/$wall_selection"
	mkdir -p ~/.cache/sddm-img
	ln -sf "$wallpaper_path" ~/.cache/img-symbol/current.wallpaper
	rm -rf /sddmt/sugar-candy/Backgrounds/
	mkdir /sddmt/sugar-candy/Backgrounds/
	cp "$wallpaper_path" /sddmt/sugar-candy/Backgrounds/
	sed -i "s|^Background=.*$|Background=Backgrounds/${wall_selection}|" /sddmt/sugar-candy/theme.conf
	sleep 0.4
  exit 0
