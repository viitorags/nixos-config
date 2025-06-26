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

  home.file.".config/swaync/style.css".source = ./style.css;
}
