{
  programs.nixvim = {
    enable = true;

    plugins.snacks = {
      enable = true;

      settings = {
        indent = {
          priority = 1;
          enabled = true;
          indent = {
            char = "┊";
            hl = [
              "SnacksIndent1"
              "SnacksIndent2"
              "SnacksIndent3"
              "SnacksIndent4"
              "SnacksIndent5"
              "SnacksIndent6"
              "SnacksIndent7"
              "SnacksIndent8"
            ];
          };
          scope = {
            enabled = true;
            priority = 200;
            char = "┊";
            underline = false;
            only_current = false;
            hl = "SnacksIndentScope";
          };
        };
        statuscolumn = {
          enabled = true;
          right = [
            "fold"
            "git"
          ];
          folds = {
            open = true;
            git_hl = true;
          };
          git = {
            patterns = [
              "GitSign"
              "MiniDiffSign"
            ];
          };
          refresh = 50;
        };
        bufdelete = {
          enabled = true;
        };
        input = {
          enabled = true;
        };
        notifier = {
          enabled = true;
        };
        explorer = {
          enabled = true;
          replace_netrw = true;
          tree = true;
          follow_file = true;
        };
        picker = {
          enabled = true;
          ui_select = true;
          sources = {
            explorer = {
              replace_netrw = true;
              tree = true;
              follow_file = true;
              focus = "list";
              watch = true;
              diagnostics = false;
              diagnostics_open = false;
              git_status = true;
              git_status_open = false;
              git_untracked = true;
              layout = {
                layout = {
                  position = "right";
                };
                preview = false;
              };
            };
          };
        };
      };
    };
  };
}
