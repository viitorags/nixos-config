{
  programs.nixvim = {
    enable = true;

    plugins.conform-nvim = {
      enable = true;
      settings = {
        formatters_by_ft = {
          lua = [ "stylua" ];
          python = [ "black" ];
          javascript = [ "prettier" ];
          typescript = [ "prettier" ];
          json = [ "prettier" ];
          html = [ "prettier" ];
          css = [ "prettier" ];
          vue = [ "prettier" ];
          sh = [ "shfmt" ];
          nix = [ "nixfmt" ];
          ejs = [ "prettier" ];
          go = [ "go fmt" ];
          php = [ "php-cs-fixer" ];
        };
        format_on_save = {
          timeout_ms = 500;
          lsp_fallback = true;
        };
      };
    };
  };
}
