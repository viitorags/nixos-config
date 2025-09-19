{
  pkgs,
  noctalia,
  ...
}:
{
  home = {
    packages = with pkgs; [
      (noctalia.packages.${system}.default.overrideAttrs (old: {
        buildInputs = [
          xkeyboard_config
          qt6.qtbase
        ];
      }))
    ];
  };
  xdg.configFile."noctalia/colors.json".source = ./colors.json;
}
