{pkgs, ...}: {
  home.packages = with pkgs; [
    # Coding Utils
    vscode
    dbeaver-bin
    stylua
    neovim
    nodePackages.sass
    ripgrep
    fd
    delta
    gh-notify
    alejandra
    clang-tools
    nodejs_22
    nixfmt-rfc-style
    nodePackages.live-server
    lazygit

    # LSP
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server
    nodePackages.eslint_d
    nodePackages.dockerfile-language-server-nodejs
    lua-language-server
    nixd
  ];
}
