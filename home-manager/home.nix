{ config, pkgs, lib, ... }:{
    imports = [
        ./modules/default.nix
    ];
    
    nixpkgs.config.allowUnfree = true;

    home = {
        username = "vitor";
        homeDirectory = "/home/vitor";
        stateVersion = "24.11";
        packages = with pkgs; [
            krita
            vscode
            prismlauncher
            lua-language-server
            nixd
            nixpkgs-fmt
            adw-gtk3
            swww
            imagemagick
            pywalfox-native
            bc
        ];
    	
        # Cursor do Mouse 
    	pointerCursor = {
            gtk.enable = true;
            x11.enable = true;
      	    name = "Bibata-Original-Ice";
      	    package = pkgs.bibata-cursors;
            size = 24;
        };

        sessionVariables = {
            QT_QUICK_CONTROLS_STYLE = "Kvantum";
        };

    };
    
}
