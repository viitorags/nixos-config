{ pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    # Desktop apps
    telegram-desktop
    discord
    obsidian
    firefox
    libsForQt5.ark
    brave
    gparted
    mpv
    (callPackage ./modules/huiontablet/default.nix { })
    exfatprogs

    # CLI utils
    tree
    wget
    git
    unzip
    ffmpeg
    zip
    brightnessctl
    nixos-shell
    docker-compose
    qemu

    # Notifications
    libnotify

    # WM and Wayland stuff
    wayland
    xwayland
    aquamarine
    wl-clipboard
    wf-recorder
    cliphist
    hyprcursor
    zsh
    eza
    xdg-user-dirs
    xdg-utils
    xdg-desktop-portal-hyprland
    hyprpolkitagent
    libsecret
    gnome-keyring

    # Sound
    pipewire
    pulseaudio
    pamixer
    pavucontrol

    # Screenshotting
    grim
    slurp

    # Other
    home-manager
    libsForQt5.qt5.qtsvg
    libsForQt5.qtstyleplugins
    libsForQt5.qt5ct
    kdePackages.qt6ct
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
    libsForQt5.qtgraphicaleffects
    cowsay
    cmatrix
  ];

  # Fonts
  fonts.packages = with pkgs; [
    font-awesome
    nerd-fonts.jetbrains-mono
  ];
}
