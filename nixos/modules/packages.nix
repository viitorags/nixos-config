{ pkgs, ... }: {	
  environment.systemPackages = with pkgs; [
    # Desktop apps
    telegram-desktop
    discord
    spotify
    obsidian
    firefox
    feh
    libsForQt5.dolphin
    ark

    # Coding stuff
    gcc
    nodejs_22
    neovim
    gh
    jdk21_headless

    # CLI utils
    tree
    wget
    git
    unzip
    ffmpeg
    zip
    brightnessctl
    lazygit
    btop

    # Notifications
    dunst
    libnotify

    # WM and Wayland stuff
    wayland
    xwayland
    wl-clipboard
    cliphist
    swaynotificationcenter
    hyprland
    hyprcursor
    kitty
    zsh
    eza
    xdg-user-dirs
    xdg-utils
    xdg-desktop-portal-hyprland
    hyprpolkitagent

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
    libsForQt5.kio-extras
    libsForQt5.ffmpegthumbs
    libsForQt5.kdegraphics-thumbnailers
    papirus-nord
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    font-awesome
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
