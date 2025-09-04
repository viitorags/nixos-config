{ pkgs, ... }:
{
  qt = {
    enable = true;
    platformTheme.name = "qt5ct";
    style.name = "kvantum";
  };

  xdg.configFile = {
    "Kvantum/kvantum.kvconfig".text = ''
      [General]
      theme=kanagawa-kvantum
    '';

    "Kvantum/kanagawa-kvantum/".source = ./kanagawa-kvantum;

  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  xdg.configFile."gtk-3.0/settings.ini".text = ''
    gtk-application-prefer-dark-theme=true
  '';

  xdg.configFile."gtk-4.0/settings.ini".text = ''
    gtk-application-prefer-dark-theme=true
  '';

  home = {
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "Cursor";
      package = pkgs.callPackage ./cursor { };
      size = 24;
    };
  };

  gtk = {
    enable = true;
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-nord;
    };
    theme = {
      name = "Kanagawa-BL-LB";
      package = pkgs.kanagawa-gtk-theme;
    };
    font = {
      name = "Sarasa Gothic CL SemiBold";
    };
  };
}
