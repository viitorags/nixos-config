{
  programs.nixvim = {
    enable = true;

    plugins.colorizer = {
      enable = true;
      settings = {
        filetypes = [
          "html"
          "css"
          "js"
          "md"
        ];
      };
    };
  };
}
