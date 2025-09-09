{ pkgs, unstable, ... }:
{
  home.packages = with pkgs; [
    # Coding Utils
    vscodium-fhs
    unstable.dbeaver-bin
    gh-notify
    lazygit
    gh
    delta
    openjdk23
    python313
    nodejs
    nodePackages.live-server
    gcc
    gnumake
    lazydocker
    jq
    fd
    ripgrep
    go
    php
    php.packages.composer
    (callPackage ./php-cs-fixer.nix { })
    laravel
    vtsls

    # Formatters
    nixfmt-rfc-style
    stylua
    black
    shfmt
    nodePackages.prettier

    # LSP
    nodePackages.intelephense
    nodePackages.vscode-langservers-extracted
    nodePackages.eslint_d
    nodePackages.dockerfile-language-server-nodejs
    vue-language-server
    pyright
    emmet-ls
    bash-language-server
    lua-language-server
    clang-tools
    gopls
    # (texlive.combine {
    #   inherit (texlive) scheme-medium latexmk;
    # })
    nixd
    kdePackages.qtdeclarative
  ];
}
