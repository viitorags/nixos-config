{ pkgs, ... }: {	
  environment.systemPackages = with pkgs; [
    # Desktop apps
    telegram-desktop
    discord
    obsidian
    spotify
    firefox
    feh
    ark
    rofi
    mpv
    
    # Coding stuff
    gcc
    nodejs_22
    neovim
    gh
    clang-tools
    gnumake

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
    cava
    nixos-shell

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
