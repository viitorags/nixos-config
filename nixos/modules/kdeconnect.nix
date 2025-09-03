{ unstable, ... }:
{
  programs.kdeconnect = {
    enable = true;
    package = unstable.kdePackages.kdeconnect-kde;
  };
}
