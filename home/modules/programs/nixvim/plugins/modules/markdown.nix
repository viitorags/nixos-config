{
  programs.nixvim = {
    plugins.render-markdown = {
      enable = true;
      settings = {
        file_types = [
          "markdown"
          "codecompanion"
        ];
        render_modes = true;
      };
    };
    plugins.markdown-preview = {
      enable = true;
    };

    extraConfigLua = ''
      vim.g.mkdp_filetypes = { "markdown" }
      vim.g.mkdp_browser = "firefox"
    '';
  };
}
