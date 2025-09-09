{ pkgs, ... }:
{
  programs.nixvim = {
    enable = true;
    extraPlugins = [ pkgs.vimPlugins.codecompanion-history-nvim ];

    plugins = {
      copilot-lua = {
        enable = true;
        lazyLoad = {
          enable = true;
          settings = {
            suggestion = {
              enabled = true;
            };
          };
        };
        settings = {
          suggestion = {
            auto_trigger = false;
            debounce = 90;
            enabled = false;
          };
        };
      };

      codecompanion = {
        enable = true;
        settings = {
          adapters = {
            copilot = {
              __raw = ''
                function()
                  return require("codecompanion.adapters").extend("copilot", {
                    schema = {
                      model = {
                        default = "claude-3.7-sonnet",
                      },
                    },
                  })
                end
              '';
            };
          };
          opts = {
            language = "pt-br";
          };
          display = {
            chat = {
              show_settings = true;
            };
          };
          extensions = {
            history = {
              enabled = true;
              opts = {
                auto_generate_title = true;
                auto_save = true;
                dir_to_save.__raw = ''vim.fn.stdpath("data") .. "/codecompanion-history",'';
              };
            };
          };
        };
      };
    };
  };
}
