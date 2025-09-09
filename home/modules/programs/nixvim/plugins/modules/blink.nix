{
  programs.nixvim = {
    enable = true;

    plugins.blink-cmp = {
      enable = true;
      luaConfig.pre = ''
        vim.api.nvim_set_hl(0, "BlinkMenu", { bg = "none" })
      '';

      settings = {
        keymap = {
          preset = "default";
          "<CR>" = [
            "accept"
            "fallback"
          ];
          "<Tab>" = { };
          "<S-Tab>" = { };
        };
        appearance = {
          use_nvim_cmp_as_default = false;
        };
        completion = {
          menu = {
            draw = {
              columns = [
                [ "kind_icon" ]
                [ "label" ]
                [ "label_description" ]
              ];
            };
          };
          list = {
            selection = {
              preselect = true;
              auto_insert = false;
            };
          };
          menu = {
            border = "rounded";
            winhighlight = "Normal:BlinkMenu,FloatBorder:BlinkMenu,CursorLine:Visual,Search:None";
          };
          documentation = {
            auto_show = true;
            window = {
              border = "rounded";
              winhighlight = "Normal:BlinkMenu,FloatBorder:BlinkMenu,CursorLine:Visual,Search:None";
            };
          };
        };
      };
    };
    plugins.friendly-snippets.enable = true;
  };
}
