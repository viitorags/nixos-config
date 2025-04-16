{ pkgs, ... }:{
    home = {
        packages = with pkgs; [
            rofi-wayland
        ];
    };

    imports = [
        ./config.nix
        ./wall_select.nix
    ];
}
