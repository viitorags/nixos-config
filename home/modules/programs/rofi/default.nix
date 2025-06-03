{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      rofi
    ];
  };

  xdg.configFile."rofi/config.rasi".source = ./themes/launcher.rasi;
  xdg.configFile."rofi/clipboard.rasi".source = ./themes/clipboard.rasi;
  xdg.configFile."rofi/wall_select.rasi".source = ./themes/wall_select.rasi;
  xdg.configFile."rofi/powermenu.rasi".source = ./themes/powermenu.rasi;
  xdg.configFile."rofi/screenshot.rasi".source = ./themes/screenshot.rasi;
}
