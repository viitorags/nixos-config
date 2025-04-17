{ pkgs, ... }:{
    home = {
        packages = with pkgs; [
            rofi
        ];
    };

    imports = [
        ./config.nix
        ./wall_select.nix
    ];
}
