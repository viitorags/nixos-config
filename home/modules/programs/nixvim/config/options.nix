{
  programs.nixvim = {
    enable = true;
    opts = {
      clipboard = "unnamedplus";
      mouse = "a";
      expandtab = false;
      shiftwidth = 4;
      tabstop = 4;
      cursorline = true;
      number = true;
      relativenumber = true;
      numberwidth = 4;
      termguicolors = true;
      wrap = false;
      smartindent = true;
      showmatch = true;
      completeopt = [
        "menuone"
        "noselect"
      ];
      foldenable = true;
      foldmethod = "expr";
      foldexpr = "nvim_treesitter#foldexpr()";
      foldlevel = 99;
      signcolumn = "yes";
      fillchars = "eob: ";
      listchars = {
        space = "•";
        tab = "• ";
        lead = "•";
        trail = "•";
      };
      wildmenu = true;
      wildmode = "longest:full,full";
      backup = false;
      swapfile = false;
      incsearch = true;
      ignorecase = true;
      smartcase = true;
      scrolloff = 8;
      sidescrolloff = 8;
      hlsearch = true;
    };
  };
}
