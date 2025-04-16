{
    programs.kitty = {
        enable = true;

        settings = {

            font_family = "JetBrains Mono Regular";
            bold_font = "JetBrains Mono Bold";
            italic_font = "JetBrains Mono Italic";
            bold_italic_font = "JetBrains Mono Bold Italic";
            font_size = 10;
            confirm_os_window_close = 0;
            
            cursor = "#928374";
            cursor_text_color = "background";

            include = "~/.cache/wal/colors-kitty.conf";
            
        };

        keybindings = {
            "ctrl+c" = "copy_or_interrupt";
        };

    };
}
