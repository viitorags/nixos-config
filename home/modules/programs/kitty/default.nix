{
  programs.kitty = {
    enable = true;

    settings = {
      font_family = "Fantasque Sans Mono Regular";
      bold_font = "Fantasque Sans Mono Bold";
      italic_font = "Fantasque Sans Mono Italic";
      bold_italic_font = "Fantasque Sans Mono Bold Italic";
      font_size = 13;
      confirm_os_window_close = 0;
      allow_remote_control = "yes";
      cursor_trail = 1;
      cursor_trail_decay = "0.1 0.4";
      frame_delay = 0;
      foreground_opacity = 1;
      background_opacity = 0.9;
      enable_audio_bell = "no";
      detect_urls = "yes";
      scrollback_lines = 10000;
      scrollback_pager = "history";
      cursor_blink_interval = 0;
      cursor_stop_blinking_after = 0;

      background = "#32302f";
      foreground = "#d4be98";

      selection_background = "#d4be98";
      selection_foreground = "#32302f";

      cursor = "#a89984";
      cursor_text_color = "#32302f";

      active_tab_background = "#32302f";
      active_tab_foreground = "#d4be98";
      active_tab_font_style = "bold";
      inactive_tab_background = "#32302f";
      inactive_tab_foreground = "#a89984";
      inactive_tab_font_style = "normal";

      # Black
      color0 = "#665c54";
      color8 = "#928374";

      # Red
      color1 = "#ea6962";
      color9 = "#ea6962";

      # Green
      color2 = "#a9b665";
      color10 = "#a9b665";

      # Yellow
      color3 = "#e78a4e";
      color11 = "#d8a657";

      # Blue
      color4 = "#7daea3";
      color12 = "#7daea3";

      # Magenta
      color5 = "#d3869b";
      color13 = "#d3869b";

      # Cyan
      color6 = "#89b482";
      color14 = "#89b482";

      # White
      color7 = "#d4be98";
      color15 = "#d4be98";
    };

    keybindings = {
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+shift+enter" = "launch --cwd=current --type=window";
      "alt+h" = "neighboring_window left";
      "alt+j" = "neighboring_window down";
      "alt+k" = "neighboring_window up";
      "alt+l" = "neighboring_window right";
      "ctrl+shift+left" = "resize_window narrower";
      "ctrl+shift+right" = "resize_window wider";
      "ctrl+shift+up" = "resize_window taller";
      "ctrl+shift+down" = "resize_window shorter";
      "ctrl+home" = "resize_window reset";
      "ctrl+shift+backspace" = "change_font_size all 12";
    };

    extraConfig = ''
      shell_integration  no-cursor
      listen_on unix:@mykitty
    '';
  };
}
