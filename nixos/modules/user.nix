{pkgs, ...}: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.vitor = {
      isNormalUser = true;
      description = "Vitor";
      extraGroups = ["networkmanager" "wheel" "docker"];
      ignoreShellProgramCheck = true;
      packages = with pkgs; [];
    };
  };
}
