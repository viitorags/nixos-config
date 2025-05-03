{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      rofi
    ];
  };

  imports = [
    ./config/config.nix
    ./config/wall_select.nix
    ./config/powermenu.nix
  ];
}
