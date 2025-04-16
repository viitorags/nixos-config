{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "right";
      positionY = "top";
      control-center-radius = 1;
      fit-to-screen = true;
      layer-shell = true;
      layer = "overlay";
      control-center-layer = "overlay";
      cssPriority = "user";
      notification-icon-size = 64;
      control-center-width = 400;
      control-center-height = 500;
      control-center-margin-top = 5;
      control-center-margin-bottom = 5;
      control-center-margin-right = 5;
      control-center-margin-left = 5;
      notification-window-width = 500;
      notification-body-image-height = 100;
      notification-body-image-width = 200;
      timeout = 10;
      timeout-low = 5;
      timeout-critical = 0;
      image-visibility = "always";

      widgets = [
        "buttons-grid"
        "volume"
        #"backlight"
        "title"
        "notifications"
        "mpris"
      ];

      widget-config = {
        title = {
          text = "Notifications";
          clear-all-button = true;
          button-text = " 󰆴 ";
        };

        volume = {
          "label" = "";
          /*"expand-button-label" = "";
          "collapse-button-label" = "";
          "show-per-app" = true;
          "show-per-app-icon" = true;
          "show-per-app-label" = false;*/
        };

        backlight = {
          "label" = "";
          "min" = 10;
        };

        dnd = {
          text = "Do Not Disturb";
        };

        mpris = {
          image-size = 96;
          blur = true;
        };

        buttons-grid = {
          actions = [
            {
              "label" = "󰐥";
              "command" = "systemctl poweroff";
            }
            {
              "label" = "󰜉";
              "command" = "systemctl reboot";
            }
            {
              "label" = "󰌾";
              "command" = "hyprlock";
            }
            {
              "label" = "󰍃";
              "command" = "hyprctl dispatch exit";
            }
            {
              "label" = "󰏦";
              "command" = "systemctl suspend";
            }
            {
              "label" = "󰕾";
              "command" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
            }
            /*
            {
              "label" = "󰍬";
              "command" = "swayosd-client --input-volume mute-toggle";
            }
            
            {
              "label" = "󰖩";
              "command" = "$HOME/.local/bin/shved/rofi-menus/wifi-menu.sh";
            }
            
            {
              "label" = "󰂯";
              "command" = "blueman-manager";
            }
            
            {
              "label" = "";
              "command" = "obs";
            }
            */
          ];
        };
      };
    };
  };

  home.file.".config/swaync/style.css".text = ''
    @import url('../../.cache/wal/colors-waybar.css');
    @define-color mpris-album-art-overlay alpha(@background, 0.55);
    @define-color mpris-button-hover alpha(@background, 0.50);
    @define-color text @color15;
    @define-color bg alpha(@background,.5);
    @define-color bg-hover alpha(@background,.8);
    @define-color mycolor @color9;
    @define-color border-color alpha(@mycolor, 0.15);

    @keyframes fadeIn{
    0% {
        padding-left:20;
        margin-left:50;
        margin-right:50;
    }
    100% {
        padding:0;
        margin:0;
    }
    }
    * {
        outline: none;
        box-shadow: none;
    }
    .control-center .notification-row {
        background-color: unset;
    }
    .control-center .notification-row .notification-background .notification,
    .control-center .notification-row .notification-background .notification .notification-content,
    .floating-notifications .notification-row .notification-background .notification,
    .floating-notifications.background .notification-background .notification .notification-content {
    }
    .notification{
        background: alpha(@mycolor,.5);

    }

    .control-center .notification-row .notification-background .notification {
        margin-top: 0.150rem;
        box-shadow: 1px 1px 5px rgba(0, 0, 0, .3);
        background: alpha(@mycolor,.3);

    }
    .floating-notifications .notification{
        animation: fadeIn .5s ease-in-out;
    }

    .control-center .notification-row .notification-background .notification box,
    .control-center .notification-row .notification-background .notification widget,
    .control-center .notification-row .notification-background .notification .notification-content,
    .floating-notifications .notification-row .notification-background .notification box,
    .floating-notifications .notification-row .notification-background .notification widget,
    .floating-notifications.background .notification-background .notification .notification-content {
        border-radius: 0.818rem;

    }
    .notification widget:hover{
        background:alpha(@mycolor,.2);
    }
    .floating-notifications.background .notification-background .notification .notification-content,
    .control-center .notification-background .notification .notification-content {
        padding-top: 0.818rem;
        padding-right: unset;
        margin-right: unset;
    }

    .control-center .notification-row .notification-background .notification.low .notification-content label,
    .control-center .notification-row .notification-background .notification.normal .notification-content label,
    .floating-notifications.background .notification-background .notification.low .notification-content label,
    .floating-notifications.background .notification-background .notification.normal .notification-content label {
        padding-top:10px;
        padding-left:10px;
        padding-right:10px;
    }

    .control-center .notification-row .notification-background .notification..notification-content image,
    .control-center .notification-row .notification-background .notification.normal .notification-content image,
    .floating-notifications.background .notification-background .notification.low .notification-content image,
    .floating-notifications.background .notification-background .notification.normal .notification-content image {
        background-color: unset;
    }

    .control-center .notification-row .notification-background .notification.low .notification-content .body,
    .control-center .notification-row .notification-background .notification.normal .notification-content .body,
    .floating-notifications.background .notification-background .notification.low .notification-content .body,
    .floating-notifications.background .notification-background .notification.normal .notification-content .body {
        color: @text;
    }

    .control-center .notification-row .notification-background .notification.critical .notification-content,
    .floating-notifications.background .notification-background .notification.critical .notification-content {
        background-color: #ffb4a9;

    }

    .control-center .notification-row .notification-background .notification.critical .notification-content image,
    .floating-notifications.background .notification-background .notification.critical .notification-content image{
        background-color: unset;
        color: #ffb4a9;

    }

    .control-center .notification-row .notification-background .notification.critical .notification-content label,
    .floating-notifications.background .notification-background .notification.critical .notification-content label {
        color: #680003;

    }
    .notification-content{
        padding:5;
    }
    .control-center .notification-row .notification-background .notification .notification-content .summary,
    .floating-notifications.background .notification-background .notification .notification-content .summary {
        font-family: 'CodeNewRoman Nerd Font Propo';
        font-size: 0.9909rem;
        font-weight: 500;
    }

    .control-center .notification-row .notification-background .notification .notification-content .time,
    .floating-notifications.background .notification-background .notification .notification-content .time {
        font-size: 0.8291rem;
        font-weight: 500;
        margin-right: 1rem;
        padding-right: unset;
    }

    .control-center .notification-row .notification-background .notification .notification-content .body,
    .floating-notifications.background .notification-background .notification .notification-content .body {
        font-family: 'CodeNewRoman Nerd Font Propo';
        font-size: 0.8891rem;
        font-weight: 400;
        margin-top: 0.310rem;
        padding-right: unset;
        margin-right: unset;
    }

    .control-center .notification-row .close-button,
    .floating-notifications.background .close-button {
        all:unset;
        background-color: unset;
        border-radius: 0%;
        border: none;
        box-shadow: none;
        margin-right: 0px;
        margin-top: 3px;
        margin-bottom: unset;
        padding-bottom: unset;
        min-height: 20px;
        min-width: 20px;
        text-shadow: none;
        color:@text;
    }

    .control-center .notification-row .close-button:hover,
    .floating-notifications.background .close-button:hover {
        all:unset;
        background-color: @bg;
        border-radius: 100%;
        border: none;
        box-shadow: none;
        margin-right: 0px;
        margin-top: 3px;
        margin-bottom: unset;
        padding-bottom: unset;
        min-height: 20px;
        min-width: 20px;
        text-shadow: none;
        color:@text;

    }

    .control-center {
        background: @bg;
        color: @text;
        border-radius: 10px;
        border:none;
        box-shadow: 1px 1px 5px rgba(0, 0, 0, .65);
    }
    .widget-title {
        padding:unset;
        margin:unset;
        color: @text;
        padding-left:20px;
        padding-top:20px;
    }

    .widget-title > button {
        padding:unset;
        margin:unset;
        font-size: initial;
        color: @text;
        text-shadow: none;
        background: rgba(255,85,85,.3);
        border: none;
        box-shadow: none;
        border-radius: 12px;
        padding:0px 10px;
        margin-right:20px;
        margin-top:3px;
        transition: all .7s ease;
    }

    .widget-title > button:hover {
        border: none;
        background: @bg-hover;
        transition: all .7s ease;
        box-shadow: 0px 0px 5px rgba(0, 0, 0, .65);
    }

    .widget-label {
        margin: 8px;
    }

    .widget-label > label {
        font-size: 1.1rem;
    }

    .widget-mpris {
    }
    .widget-mpris .widget-mpris-player {
        padding: 16px;
        margin: 16px 20px;
        background-color: @mpris-album-art-overlay;
        border-radius: 12px;
        box-shadow: 1px 1px 5px rgba(0, 0, 0, .65);
    }
    .widget-mpris .widget-mpris-player button:hover {
        all: unset;
        background: @bg-hover;
        text-shadow: none;
        border-radius: 15px;
        border: none; 
        padding: 5px; 
        margin: 5px;
        transition: all 0.5s ease; 
    }
    .widget-mpris .widget-mpris-player button {
        color:@text;
        text-shadow: none;
        border-radius: 15px;
        border: none;
        padding: 5px;
        margin: 5px;
        transition: all 0.5s ease;
    }
    .widget-mpris .widget-mpris-player button:not(.selected) {
        background: transparent;
        border: 2px solid transparent;
    }
    .widget-mpris .widget-mpris-player button:hover {
        border: 2px solid transparent;
    }

    .widget-mpris .widget-mpris-player .widget-mpris-album-art {
        border-radius: 20px;
        box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.75);
    }

    .widget-mpris .widget-mpris-player .widget-mpris-title {
        font-weight: bold;
        font-size: 1.25rem;
    }

    .widget-mpris .widget-mpris-player .widget-mpris-subtitle {
        font-size: 1.1rem;
    }

    .widget-mpris .widget-mpris-player > box > button:hover {
        background-color: @mpris-button-hover;
    }
    .widget-buttons-grid {
        font-family:"CodeNewRoman Nerd Font Propo";
        padding-left: 8px;
        padding-right: 8px;
        padding-bottom: 8px;
        margin: 10px;
        border-radius: 12px;
        background:transparent;
    }

    .widget-buttons-grid>flowbox>flowboxchild>button label {
        font-size: 20px;
        color: @color7;
        transition: all .7s ease;
    }
    .widget-buttons-grid>flowbox>flowboxchild>button:hover label {
        font-size: 20px;
        color: @text;
        transition: all .7s ease;
    }
    .widget-buttons-grid > flowbox > flowboxchild > button {
        background: transparent;
        border-radius: 12px;
        text-shadow:none;
        box-shadow: 0px 0px 8px rgba(255,255,255, .02);
        transition: all .5s ease;
    }
    .widget-buttons-grid > flowbox > flowboxchild > button:hover {
        background: @color4;
        box-shadow: 0px 0px 2px rgba(0, 0, 0, .2);
        transition: all .5s ease;

    }

    .widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked {
        background: @mycolor;
    }
    .widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked label {
        color: @background;
    }

    .widget-menubar > box > .menu-button-bar > button {
        border: none;
        background: transparent;
    }

    .topbar-buttons > button {
        border: none;
        background: transparent;
    }

    trough {
        border-radius: 20px;
        background: transparent;
    }

    trough highlight {
        border: none;
        padding: 5px;
        background: @mycolor;
        border-radius: 20px;
        box-shadow: 0px 0px 5px rgba(0, 0, 0, .5);
        transition: all .7s ease;
    }
    trough highlight:hover {
        padding: 5px;
        background: @mycolor;
        border-radius: 20px;
        box-shadow: 0px 0px 5px rgba(0, 0, 0, 1);
        transition: all .7s ease;
    }

    trough slider {
        border: none;
        background: transparent;
    }
    trough slider:hover {
        border: none;
        background: transparent;
    }

    .widget-volume {
        background-color: transparent;
        padding: 8px;
        margin: 8px;
        border-radius: 12px;
    }
    .widget-backlight {
        background-color: transparent;
        padding: 8px;
        margin: 8px;
        border-radius: 12px;
    }
  '';

}
