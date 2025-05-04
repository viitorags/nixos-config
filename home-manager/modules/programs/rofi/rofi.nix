{ pkgs, ... }:
{
  home = {
    packages = with pkgs; [
      rofi
      haskellPackages.greenclip
    ];
  };

  imports = [
    ./themes/config.nix
    ./themes/wall_select.nix
    ./themes/powermenu.nix
    ./themes/clipboard.nix
  ];
}
