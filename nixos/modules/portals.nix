{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    wlr.enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];
    configPackages = with pkgs; [
      # xdg-desktop-portal-gtk
      # xdg-desktop-portal-gnome
      niri
    ];
    config = {
      common = {
        default = [
          "gnome"
          "gtk"
        ];
        "org.freedesktop.impl.portal.ScreenCast" = "gnome";
        "org.freedesktop.impl.portal.Screenshot" = "gnome";
        # "org.freedesktop.impl.portal.RemoteDesktop" = "gnome";
      };
    };
  };
}
