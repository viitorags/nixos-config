{ config, pkgs, ... }:{
    imports = [
        ./hyprland.nix
        ./hyprpaper.nix
	    ./hyprlock.nix
        ./wlogout.nix
        ./waybar.nix
    ];
}
