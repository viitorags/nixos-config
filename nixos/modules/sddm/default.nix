{
  imports = [
    ./sddmTheme.nix
  ];

  # Sddm
  services.displayManager.sddm = {
    enable = true;
    theme = "sugar-candy";
  };
}
