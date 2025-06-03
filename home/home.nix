{ pkgs, goanime, ... }:
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
      kitty.terminfo
      openshot-qt
      bc
      ibus
      dwt1-shell-color-scripts
      # (callPackage ./modules/programs/pokemon-col-sh.nix { }).pokemon-colorscripts
    ];

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "Capitaine Cursors (Gruvbox)";
      package = pkgs.capitaine-cursors-themed;
      size = 24;
    };

    sessionVariables = {
      QT_QUICK_CONTROLS_STYLE = "Kvantum";
      GTK_IM_MODULE = "ibus";
      TERMINAL = "kitty";
    };
  };
}
