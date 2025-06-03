{ config, pkgs, ... }:
{
  programs.btop = {
    enable = true;

    settings = {
      color_theme = "TTY";

      truecolor = true;

      net_iface = "";

      shown_boxes = "cpu mem proc";

    };
  };
}
