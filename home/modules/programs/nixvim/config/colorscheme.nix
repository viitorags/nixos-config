{
  programs.nixvim = {
    colorschemes = {
      kanagawa = {
        enable = true;

        settings = {
          colors = {
            theme = {
              all = {
                ui = {
                  bg_gutter = "none";
                };
              };
              wave = {
                ui = {
                  bg_gutter = "none";
                  float = {
                    bg = "none";
                  };
                };
              };
            };
          };
          commentStyle = {
            italic = true;
          };
          compile = false;
          dimInactive = false;
          functionStyle = { };
          overrides = "function(colors) return {} end";
          terminalColors = true;
          theme = "wave";
          transparent = false;
          undercurl = true;
        };
      };
    };
  };
}
