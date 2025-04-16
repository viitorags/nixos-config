{
  home.file.".config/rofi/wall_select.rasi".text = ''
        // # z0mbi3 -  https://github.com/gh0stzk/dotfiles

        configuration {
            modi:                        "drun";
            show-icons:                  true;
            drun-display-format:         "{name}";
            font: "JetBrains Mono 15";
            hover-select: true;
            me-select-entry: "";
            me-accept-entry: "MousePrimary";
        }

        //----- Global Properties -----//
        @import                          "~/.cache/wal/colors-rofi"

        * {
            main-bg: @background;
            main-fg: @foreground;
            select-bg: @color3;
            select-fg: @color7;
        }

        //----- Main Window -----//

        window {
            enabled:                     true;
            fullscreen:                  false;
            width:                       80%;
            transparency:                "real";
            cursor:                      "default";
            spacing:                     0px;
            padding:                     0px;
            border:                      0px;
            border-radius:               10;
            border-color:                transparent;
            background-color:            transparent; 
        }

        mainbox {
            enabled: true;
            children: [ "listview" ];
            background-color: @main-bg;
        }

        listview {
            enabled:                     true;
            columns:                     4;
            lines:                       1;
            spacing:                     40px;
            padding:                     20px 20px;
            cycle:                       true;
            dynamic:                     false;
            scrollbar:                   false;
            layout:                      vertical;
            reverse:                     true;
            fixed-height:                true;
            fixed-columns:               true;
            cursor:                      "default";
            background-color:            transparent;
            text-color:                  @main-fg;
        }

        element {
            enabled:                     true;
            orientation:                 vertical;
            spacing:                     0px;
            padding:                     0px;
            border-radius:               20px;
            cursor:                      pointer;
            background-color:            transparent;
            text-color:                  @main-fg;
        }

        @media(max-aspect-ratio: 1.8) {
            element {
                orientation:             vertical;
            }
        }

        element.selected.normal {
            background-color:            @select-bg;
            text-color:                  @select-fg;
        }
       
        element-icon {
            size:                        40%;
            cursor:                      inherit;
            border-radius:               0px;
            background-color:            transparent;
            text-color:                  inherit;
        }

        element-text {
            vertical-align:              0.5;
            horizontal-align:            0.5;
            padding:                     10px;
            cursor:                      inherit;
            background-color:            transparent;
            text-color:                  inherit;
        }
      
  '';
}
