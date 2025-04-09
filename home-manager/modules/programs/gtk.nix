{ pkgs, ... }:{
    gtk = {
        enable = true;
        iconTheme = {
            name = "Papirus-Dark";
            package = pkgs.papirus-icon-theme;
        };
        theme = {
            name = "Gruvbox-Dark";
            package = pkgs.gruvbox-gtk-theme;
        };	
    };

}
