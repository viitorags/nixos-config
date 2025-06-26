{ pkgs, ... }:
{
  imports = [
    ./modules/default.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "vitor";
    homeDirectory = "/home/vitor";
    stateVersion = "25.05";
    packages = with pkgs; [
      krita
      prismlauncher
      swww
      zathura
      kitty.terminfo
      openshot-qt
      bc
      ibus
      gnome.gvfs
    ];

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "catppuccin-mocha-mauve-cursors";
      package = pkgs.catppuccin-cursors.mochaMauve;
      size = 24;
    };

    sessionVariables = {
      QT_QUICK_CONTROLS_STYLE = "Kvantum";
      GTK_IM_MODULE = "ibus";
      TERMINAL = "kitty";
    };

  };
}
