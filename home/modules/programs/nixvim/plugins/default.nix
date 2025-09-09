{
  imports = [
    ./modules/lsp.nix
    ./modules/blink.nix
    ./modules/conform.nix
    ./modules/snacks.nix
    ./modules/treesitter.nix
    ./modules/lualine.nix
    ./modules/alpha.nix
    ./modules/miniIcons.nix
    ./modules/codeCompanion.nix
    ./modules/colorizer.nix
    ./modules/markdown.nix
  ];
  programs.nixvim = {
    enable = true;
    plugins.lz-n.enable = true;
    plugins.nvim-autopairs.enable = true;
    plugins.lspsaga.enable = true;
    plugins.nvim-ufo.enable = true;
    plugins.noice.enable = true;
    plugins.web-devicons.enable = true;
    plugins.rainbow-delimiters.enable = true;
    plugins.nvim-surround.enable = true;
    plugins.which-key.enable = true;
  };
}
