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
      ueberzug
      unstable.pokemon-colorscripts
    ];

    sessionVariables = {
      GTK_IM_MODULE = "ibus";
      TERMINAL = "wezterm";
    };

    file."Pictures/Wallpapers/".source = ../assets/wallpapers;
    file.".face".source = ../assets/profile.jpg;
  };

  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };
}
