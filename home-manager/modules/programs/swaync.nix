{
  services.swaync = {
    enable = true;
    settings = {
      positionX = "left";
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
        #"buttons-grid"
        "title"
        "notifications"
        "volume"
        "backlight"
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
          /*
              "expand-button-label" = "";
            "collapse-button-label" = "";
            "show-per-app" = true;
            "show-per-app-icon" = true;
            "show-per-app-label" = false;
          */
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
    @define-color cc-bg rgba(50, 48, 47, 0.9);
    @define-color noti-bg rgba(60, 56, 54, 0.9);
    @define-color noti-bg-darker rgba(60, 56, 54, 0.9);
    @define-color noti-border-color #d8a657;
    @define-color noti-bg rgba(60, 56, 54, 0.9);
    @define-color noti-bg-darker rgba(60, 56, 54, 0.9);
    @define-color noti-bg-hover rgb(27, 27, 43);
    @define-color noti-bg-focus rgba(27, 27, 27, 0.9);
    @define-color text-color #f9f5d7;
    @define-color text-color-disabled #bdae93;
    @define-color bg-selected #fabd2f;
    * {
        font-family: JetBrainsMono SemiBold;
        font-weight: bold;
        font-size: 14px
     }

     .control-center .notification-row:focus,
     .control-center .notification-row:hover {
         opacity: 1;
         background: @noti-bg-darker
     }

     .notification-row {
         outline: none;
         margin-top: 0.150rem;
         padding: 0;
     }

     .notification {
         background: transparent;
         margin: 0px;
     }

     .notification-content {
         background: @cc-bg;
         padding: 7px;
         border-radius: 5px;
         border: 2px solid #d8a657;
     		margin: 0;
     }

     .close-button {
         background: #d79921;
         color: @cc-bg;
         text-shadow: none;
         padding: 0;
         border-radius: 5px;
         margin-top: 5px;
         margin-right: 5px;
     }

     .close-button:hover {
         box-shadow: none;
         background: #fabd2f;
         transition: all .15s ease-in-out;
         border: none
     }

     .notification-action {
         color: #ebdbb2;
         border: 2px solid #d8a657;
         border-top: none;
         border-radius: 5px;
         background: #32302F;
     }

     .notification-default-action:hover,
     .notification-action:hover {
         color: #ebdbb2;
         background: #32302F;
     }

     .summary {
      padding-top: 7px;
         font-size: 13px;
         color: #ebdbb2;
     }

     .time {
         font-size: 11px;
         color: #d79921;
         margin-right: 24px
     }

     .body {
         font-size: 12px;
         color: #ebdbb2;
     }

     .control-center {
         background: @cc-bg;
         border: 2px solid #d8a657;
         border-radius: 5px;
     }

     .control-center-list {
         background: transparent
     }

     .control-center-list-placeholder {
         opacity: .5
     }

     .floating-notifications {
         background: transparent
     }

     .blank-window {
         background: alpha(black, 0.1)
     }

     .widget-title {
         color: #f9f5d7;
         background: @noti-bg-darker;
         padding: 5px 10px;
         margin: 10px 10px 5px 10px;
         font-size: 1.5rem;
         border-radius: 5px;
     }

     .widget-title>button {
         font-size: 1rem;
         color: @text-color;
         text-shadow: none;
         background: @noti-bg;
         box-shadow: none;
         border-radius: 5px;
     }

     .widget-title>button:hover {
         background: #d79921;
         color: @cc-bg;
     }

     trough {
         border-radius: 20px;
         background: @cc-bg;
     }

     trough highlight {
       padding: 2px;
       background: #d79921;
       border: none;
     }

     trough slider {
         border-color: #d79921;
         background: @cc-bg;
         box-shadow: none;
     }

     .widget-dnd {
         background: @noti-bg-darker;
         padding: 5px 10px;
         margin: 5px 10px 10px 10px;
         border-radius: 5px;
         font-size: large;
         color: #f2e5bc;
     }

     .widget-dnd>switch {
         border-radius: 4px;
         background: #665c54;
     }

     .widget-dnd>switch:checked {
         background: #d79921;
         border: 1px solid #d79921;
     }

     .widget-dnd>switch slider {
         background: @cc-bg;
         border-radius: 5px
     }

     .widget-dnd>switch:checked slider {
         background: @cc-bg;
         border-radius: 5px
     }

     .widget-label {
         margin: 10px 10px 5px 10px;
     }

     .widget-label>label {
         font-size: 1rem;
         color: @text-color;
     }

     .widget-mpris {
         color: @text-color;
         background: @noti-bg-darker;
         padding: 5px 10px 0px 0px;
         margin: 5px 10px 5px 10px;
         border-radius: 5px;
     }

     .widget-mpris > box > button {
         border-radius: 5px;
     }

     .widget-mpris-player {
         padding: 5px 10px;
         margin: 10px
     }

     .widget-mpris-title {
         font-weight: 700;
         font-size: 1.25rem
     }

     .widget-mpris-subtitle {
         font-size: 1.1rem
     }

     .widget-buttons-grid {
         font-size: large;
         padding: 5px;
         margin: 5px 10px 10px 10px;
         border-radius: 5px;
         background: @noti-bg-darker;
     }

     .widget-buttons-grid>flowbox>flowboxchild>button {
         margin: 3px;
         background: @cc-bg;
         border-radius: 5px;
         color: @text-color;
         text-shadow: none;
         box-shadow: none;
     }

     .widget-buttons-grid>flowbox>flowboxchild>button:hover {
         background: #d79921;
         color: @cc-bg;
     }

     .widget-menubar>box>.menu-button-bar>button {
         border: none;
         background: transparent
     }

     .topbar-buttons>button {
         border: none;
         background: transparent
     }
     .blank-window {
       background: transparent;
     }
  '';
}
