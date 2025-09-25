{
  pkgs,
  ...
}:
let
  sddm-astronaut = pkgs.sddm-astronaut.override {
    embeddedTheme = "jake_the_dog";
    # themeConfig = {
    # };
  };
in
{
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      package = pkgs.kdePackages.sddm;
      theme = "sddm-astronaut-theme";
      extraPackages = [ sddm-astronaut ];
    };
  };

  environment.systemPackages = [ sddm-astronaut ];
}
