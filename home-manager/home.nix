{ pkgs, ... }:
{
  imports = [
    ./modules/default.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home = {
    username = "vitor";
    homeDirectory = "/home/vitor";
    stateVersion = "24.11";
    packages = with pkgs; [
      # Extras
      krita
      prismlauncher
      swww
      rich-cli
      zathura
      dwt1-shell-color-scripts
      bc
    ];

    # Cursor do Mouse
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      name = "Capitaine Cursors (Gruvbox)";
      package = pkgs.capitaine-cursors-themed;
      size = 24;
    };

    sessionVariables = {
      QT_QUICK_CONTROLS_STYLE = "Kvantum";
      preSwitch = ''
        # Remover o arquivo alterado manualmente antes de rodar o switch
        rm -rf ~/.config/rofi
      '';
    };
  };
}
