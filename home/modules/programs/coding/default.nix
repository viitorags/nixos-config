{ pkgs, unstable, ... }:
{
  home.packages = with pkgs; [
    # Coding Utils
    vscode-fhs
    unstable.dbeaver-bin
    neovim
    gh-notify
    lazygit
    gh
    delta
    openjdk23
    python313
    nodejs
    nodePackages.live-server
    dotnet-sdk_9
    netcoredbg
    gcc
    gnumake
    lazydocker
    jq
    fd
    ripgrep
    go

    # Formatters
    nixfmt-rfc-style
    stylua
    black
    shfmt
    nodePackages.prettier

    # LSP
    nodePackages.vscode-langservers-extracted
    nodePackages.typescript-language-server
    nodePackages.eslint_d
    nodePackages.dockerfile-language-server-nodejs
    pyright
    emmet-ls
    bash-language-server
    lua-language-server
    clang-tools
    jdt-language-server
    roslyn-ls
    gopls
    # (texlive.combine {
    #   inherit (texlive) scheme-medium latexmk;
    # })
    nixd
  ];
}
