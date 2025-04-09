{ pkgs, ...}:
let
    gruvboxPkgs = import ./gruvbox.nix {
        inherit (pkgs) stdenv fetchFromGitHub;
    };
in {
    
    home.packages = [ gruvboxPkgs.kvantum-gruvbox ];
    qt = {
        enable = true;
        platformTheme.name = "qt5ct";
        style.name = "kvantum";
    };
    
    xdg.configFile = {
        "Kvantum/kvantum.kvconfig".text = ''
            [General]
            theme=gruvbox-kvantum
        '';

        "Kvantum/gruvbox-kvantum".source = "${gruvboxPkgs.kvantum-gruvbox}/share/Kvantum/gruvbox-kvantum/gruvbox-kvantum";
    };

}
