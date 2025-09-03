{
  pkgs,
  quickshell,
  noctalia,
  ...
}:
{
  home = {
    packages = with pkgs; [
      # quickshell.packages.${system}.default
      (noctalia.packages.${system}.default.overrideAttrs (old: {
        buildInputs = [
          xkeyboard_config
          qt6.qtbase
        ];
      }))
    ];
  };
}
