{ unstable, pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    extraPlugins = [ unstable.vimPlugins.nvim-lspconfig ];

    plugins.lsp = {
      enable = true;
      inlayHints = true;

      servers = {
        "volar" = {
          enable = true;
          package = pkgs.vue-language-server;
        };
        "intelephense" = {
          enable = true;
          package = pkgs.nodePackages.intelephense;
        };
        gopls = {
          enable = true;
          settings = {
            hints = {
              assignVariableTypes = true;
              compositeLiteralFields = true;
              compositeLiteralTypes = true;
              constantValues = true;
              functionTypeParameters = true;
              parameterNames = true;
              rangeVariableTypes = true;
            };
          };
        };
        lua_ls.enable = true;
        marksman.enable = false;
        pyright.enable = true;
        nixd.enable = true;
        clangd.enable = true;
        html.enable = true;
        cssls.enable = true;
        emmet_ls = {
          enable = true;
          filetypes = [
            "html"
            "markdown"
          ];
        };
        vtsls.enable = true;
      };
    };
  };
}
