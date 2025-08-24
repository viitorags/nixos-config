{
  pkgs,
  unstable,
  ...
}:
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
      xfce.thunar
      gnome.gvfs
      xfce.tumbler
      swww
      zathura
      kitty.terminfo
      openshot-qt
      bc
      ibus
      imagemagick
      unstable.pokemon-colorscripts
    ];

    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "catppuccin-macchiato-mauve-cursors";
      package = pkgs.catppuccin-cursors.macchiatoMauve;
      size = 24;
    };

    sessionVariables = {
      QT_QUICK_CONTROLS_STYLE = "Kvantum";
      GTK_IM_MODULE = "ibus";
      TERMINAL = "wezterm";
    };
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
