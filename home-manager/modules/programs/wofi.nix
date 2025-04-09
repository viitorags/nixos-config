{
    programs.wofi = {
        enable = true;
        
        settings = {
            width = "400";
            height = "520";
            location = "center";
            columns = "3";
            show = "drun";
            prompt = "Search...";
            filter_rate = "100";
            allow_markup = "true";
            dmenu-parse_actions = true;
            no_actions = false;
            halign = "fill";
            valign = "start";
            content_halign = "fill";
            orientation = "vertical";
            insensitive = true;
            allow_images = true;
            image_size = "48";
            gtk_dark= true;
            layer = "top";
            term = "kitty";
            hide_scroll = true;
            normal_window = true;
            line_wrap = "word_char";
            dynamic_lines = true;
            matching = "multi-contains";
            pre_display_exec = true;
            parse_search = true;

            key_down = "Ctrl-j";
            key_up = "Ctrl-k";
            key_left = "Ctrl-h";
            key_right = "Ctrl-l";
            key_expand = "Ctrl-o";
        };

        style = ''
            window {
                margin: 0px;
                border: 2px none #ebdbb2;
                border-width: 2px;
                background-color: #282828;
                border-radius: 4px;
            }

            #input {
                padding: 4px;
                margin: 4px;
                padding-left: 20px;
                border: none;
                border-width: 2px;
                color: #ebdbb2;
                font-family: Hack Nerd Font;
                font-size: 16px;
                font-weight: 800;
                background-color: none;
                /* background: ; */
                outline: none;
                border-radius: 4px;
                margin: 10px 13px;
                margin-bottom: 2px;
            }

            #input:focus {
                border: 0px solid transparent;
                margin-bottom: 0px;
            }

            #inner-box {
                margin: 4px;
                border: 4px solid transparent;
                color: #ebdbb2;
                font-weight: normal;
                background-color: transparent;
                /* background-color: red; */
                border-radius: 4px;
            }

            #outer-box {
                margin: 0px;
                border: 0px solid #ebdbb2;
                border-radius: 4px;
                background-color: #282828;
            }

            #scroll {
                background-color: transparent;
                margin-top: 5px;
                border: none;
                border-radius: 4px;
                margin-bottom: 5px;
            }

            #img {
                margin-right: 10px;
            }

            #img:selected {
                background-color: #ebdbb2;
                margin-right: 10px;
                border-radius: 4px;
            }

            #img:unselected {
                background-color: transparent;
                margin-right: 10px;
                border-radius: 4px;
            }

            #text:selected {
                color: #ebdbb2;
                margin: 0px 0px;
                border: none;
                border-color: #ebdbb2;
                border-width: 2px;
                border-radius: 4px;
                background-color: transparent;
            }

            #text:unselected {
                color: #ebdbb2;
                margin: 0px 0px;
                border: none;
                border-color: #ebdbb2;
                border-width: 2px;
                border-radius: 4px;
                background-color: transparent;
            }

            #entry {
                margin: 0px 0px;
                border: none;
                border-radius: 4px;
                background-color: transparent;
            }

            #entry:selected {
                margin: 0px 0px;
                border: none;
                border-radius: 4px;
                background-color: transparent;
            }
        '';
    };
}
