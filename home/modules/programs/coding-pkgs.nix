{ pkgs, unstable, ... }:
{
  home.packages = with pkgs; [
    # Coding Utils
    vscode
    #jetbrains.rider
    unstable.dbeaver-bin
    stylua
    neovim
    gh-notify
    nixfmt-rfc-style
    lazygit
    lazydocker
    stylua
    openjdk23
    python313
    nodejs
    nodePackages.prettier
    nodePackages.live-server
    dotnet-sdk_9
    netcoredbg
    gcc
    gnumake
    lazydocker
    black
    jq
    fd
    ripgrep
    shfmt

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
    (texlive.combine {
      inherit (texlive) scheme-medium latexmk;
    })
    nixd
  ];
}
