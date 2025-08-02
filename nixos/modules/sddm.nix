{
  unstable,
  ...
}:
let
  sddm-astronaut = unstable.sddm-astronaut.override {
    embeddedTheme = "hyprland_kath";
  };
in
{
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      package = unstable.kdePackages.sddm;
      theme = "sddm-astronaut-theme"; # Name of theme package
      extraPackages = [ sddm-astronaut ]; # Should be here
    };
    displayManager.defaultSession = "hyprland";
  };

  environment.systemPackages = [ sddm-astronaut ]; # And here, also adds a lot of bloat
}
