{
  programs.zathura = {
    enable = true;

    options = {
      window-title-basename = true;
      statusbar-h-padding = 0;
      statusbar-v-padding = 0;
      page-padding = 3;

      scroll-half-up = "u";
      scroll-half-down = "d";
      toggle_page_mode = "D";
      reload = "r";
      rotate = "R";
      zoom-in = "K";
      zoom-out = "J";
      # recolor = "i";
      print = "p";
      recolor = false;
      recolor-keephue = true;
      render-loading = true;

      notification-error-bg = "rgba(24,25,38,1)";
      notification-error-fg = "rgba(237,135,150,1)";
      notification-warning-bg = "rgba(24,25,38,1)";
      notification-warning-fg = "rgba(249,226,175,1)";
      notification-bg = "rgba(24,25,38,1)";
      notification-fg = "rgba(166,218,149,1)";

      completion-bg = "rgba(65,69,89,1)";
      completion-fg = "rgba(202,211,245,1)";
      completion-group-bg = "rgba(36,39,58,1)";
      completion-group-fg = "rgba(165,173,203,1)";
      completion-highlight-bg = "rgba(138,173,244,1)";
      completion-highlight-fg = "rgba(65,69,89,1)";

      index-bg = "rgba(65,69,89,1)";
      index-fg = "rgba(202,211,245,1)";
      index-active-bg = "rgba(138,173,244,1)";
      index-active-fg = "rgba(65,69,89,1)";

      inputbar-bg = "rgba(24,25,38,1)";
      inputbar-fg = "rgba(202,211,245,1)";

      statusbar-bg = "rgba(65,69,89,1)";
      statusbar-fg = "rgba(202,211,245,1)";

      highlight-color = "rgba(249,226,175,0.5)";
      highlight-active-color = "rgba(250,179,135,0.5)";

      default-bg = "rgba(24,25,38,1)";
      default-fg = "rgba(202,211,245,1)";
      render-loading-bg = "rgba(24,25,38,1)";
      render-loading-fg = "rgba(202,211,245,1)";

      recolor-lightcolor = "rgba(24,25,38,1)";
      recolor-darkcolor = "rgba(202,211,245,1)";
    };
  };
}
