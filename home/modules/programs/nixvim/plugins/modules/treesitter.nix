{
  programs.nixvim = {
    enable = true;

    plugins.treesitter = {
      enable = true;
      settings = {
        auto_install = true;
        ensure_installed = [
          "c"
          "lua"
          "css"
          "html"
          "cpp"
          "javascript"
          "java"
          "nix"
          "markdown"
          "markdown_inline"
          "json"
          "yaml"
          "python"
          "go"
          "php"
          "bash"
        ];

        highlight = {
          enable = true;
          additional_vim_regex_highlighting = false;
        };

        indent = {
          enable = true;
        };

        folding = true;
      };
    };
  };
}
