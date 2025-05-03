{
  services.xserver = {
    enable = true;

    xkb = {
      layout = "br";
      variant = "";
    };
    videoDrivers = ["modesetting"];
    deviceSection = ''
      Option "AccelMethod" "none"
    '';
  };
}
