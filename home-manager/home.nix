{ pkgs, ... }:
{
  imports = [
    ./modules/default.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "vitor";
    homeDirectory = "/home/vitor";
    stateVersion = "24.11";
    packages = with pkgs; [
      # Extras
      krita
      prismlauncher
      swww
      zathura
      bc
      (callPackage ./modules/programs/pokemon-col-sh.nix { }).pokemon-colorscripts
    ];

    # Cursor do Mouse
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "Capitaine Cursors (Gruvbox)";
      package = pkgs.capitaine-cursors-themed;
      size = 24;
    };

    sessionVariables = {
      QT_QUICK_CONTROLS_STYLE = "Kvantum";
    };
  };
}
