{ pkgs, unstable, ... }:
{
  environment.systemPackages = with pkgs; [
    # Desktop apps
    telegram-desktop
    discord
    obsidian
    firefox
    ark
    brave
    gparted
    mpv

    # Coding stuff
    gcc
    gh
    gnumake

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

    # Notifications
    libnotify

    # WM and Wayland stuff
    wayland
    xwayland
    wl-clipboard
    cliphist
    hyprland
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
    papirus-nord
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    font-awesome
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
