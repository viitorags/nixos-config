{
  home.file.".config/rofi/config.rasi".text = ''
    
    configuration {
        show-icons: true;
        font: "JetBrains Mono 12";
        icon-theme: "Papirus-Dark";

        display-ssh:    "󰣀 ssh:";
        display-run:    "󱓞 run:";
        display-drun:   "󰣖 drun:";
        display-window: "󱂬 window:";
        display-combi:  "󰕘 combi:";
        display-filebrowser: "󰉋 filebrowser:";

        dpi: 120;
    }
        
    @import                          "~/.cache/wal/colors-rofi"

    
* {
    bg0: @background;
    bg1: @color3;
    grey0: @color5;
    fg0: @foreground;

    blue: @color1;
    red: @color2;
    orange: @color4;
    green: @color6;
    bgStatusline3: @color8;

    background-color: @bg0;
}

window {
    width: 600;
    border: 1;
    border-radius: 10;
    border-color: @bgStatusline3;
}

mainbox {
    spacing: 0;
    children: [inputbar, message, listview];
}

inputbar {
    color: @fg0;
    padding: 14;
    background-color: @bg0;
}

message {
    padding: 10;
    background-color: @grey0;
}

listview {
    padding: 8;
    columns: 2;
    lines: 7;
    border-radius: 0 0 10 10;
    border: 2 2 2 2;
    border-color: @bg0;
    background-color: @bg0;
    dynamic: false;
}

textbox {
    text-color: @fg0;
    background-color: inherit;
}

error-message {
    border: 20 20 20 20;
}

entry, prompt, case-indicator {
    text-color: inherit;
}

prompt {
    margin: 0 10 0 0;
}

element {
    padding: 5;
    vertical-align: 0.5;
    border-radius: 10;
    background-color: @bg1;
}

element.selected.normal {
    background-color: @bg1;
}

element.alternate.normal {
    background-color: inherit;
}

element.normal.active, element.alternate.active {
    background-color: @orange;
}

element.selected.active {
    background-color: @green;
}

element.normal.urgent, element.alternate.urgent {
    background-color: @red;
}

element.selected.urgent {
    background-color: @blue;
}

element-text, element-icon {
    size: 40;
    margin: 0 10 0 0;
    vertical-align: 0.5;
    background-color: inherit;
    text-color: @fg0;
}

element-text .active, element-text .urgent {
    text-color: @bg0;
}

 '';
}
