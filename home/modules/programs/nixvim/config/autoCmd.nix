{
  programs.nixvim = {
    enable = true;

    autoCmd = [
      {
        event = [ "FileType" ];
        pattern = [
          "nix"
          "vue"
          "jsonc"
          "json"
        ];
        callback = {
          __raw = "function() vim.bo.expandtab = true vim.bo.shiftwidth = 2 vim.bo.tabstop = 2 end";
        };
      }
      {
        event = [ "FileType" ];
        pattern = [ "make" ];
        callback = {
          __raw = "function() vim.opt_local.expandtab = false vim.opt_local.tabstop = 4 vim.opt_local.shiftwidth = 4 end";
        };
      }
      {
        event = [
          "BufNewFile"
          "BufRead"
        ];
        pattern = [ "*.ejs" ];
        command = "set filetype=html";
      }
    ];
  };
}
