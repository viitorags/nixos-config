{ pkgs, ... }:
let
  huiontablet = pkgs.callPackage ./huiontablet/default.nix { };
in
{
  services.udev.packages = [
    huiontablet
  ];
}
