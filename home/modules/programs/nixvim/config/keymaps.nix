{
  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    keymaps = [
      {
        mode = "n";
        key = "<leader>e";
        action = {
          __raw = ''
            function()
              local explorer_pickers = require("snacks.picker").get({ source = "explorer" })
              for _, v in pairs(explorer_pickers) do
                if v:is_focused() then
                  v:close()
                else
                  v:focus()
                end
              end
              if #explorer_pickers == 0 then
                require("snacks.picker").explorer()
              end
            end
          '';
        };
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>f";
        action = {
          __raw = ''
            function()
              require("snacks.picker").smart()
            end
          '';
        };
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>b";
        action = {
          __raw = ''
            function()
              require("snacks.picker").buffers()
            end
          '';
        };
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>/";
        action = {
          __raw = ''
            function()
              require("snacks.picker").grep()
            end
          '';
        };
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>:";
        action = {
          __raw = ''
            function()
              require("snacks.picker").command_history()
            end
          '';
        };
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>n";
        action = {
          __raw = ''
            function()
              require("snacks.picker").notifications()
            end
          '';
        };
        options = {
          silent = true;
        };
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<C-c>";
        action = ''"+y'';
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-s>";
        action = ":w<CR>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = "i";
        key = "<C-s>";
        action = "<C-o>:w<CR>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-f>";
        action = ":%s/foo/bar";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = "v";
        key = "<C-f>";
        action = ":s/foo/bar";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<Space>a";
        action = ":CodeCompanionChat Toggle<CR>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<Space>ca";
        action = ":CodeCompanionActions<CR>";
        options = {
          noremap = true;
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-q>";
        action = ":lua Snacks.bufdelete()<CR>";
        options = {
          noremap = true;
          silent = true;
        };
      }
    ];
  };
}
