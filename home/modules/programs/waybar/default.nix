{
  programs.waybar = {
    enable = true;
    style = builtins.readFile ./waybar.css;
    settings = [
      {
        "layer" = "top";
        "position" = "left";
        "width" = 35;
        "margin-top" = 5;
        "margin-bottom" = 5;
        "margin-left" = 2;
        "modules-left" = [
          "clock"
          "custom/sep"
          "tray"
        ];
        "modules-center" = [ "hyprland/workspaces" ];
        "modules-right" = [
          "temperature"
          "custom/sep"
          "pulseaudio"
          "custom/sep"
          "network"
          "custom/notification"
        ];

        "hyprland/workspaces" = {
          "format" = "{icon}";
          "disable-scroll" = true;
          "on-click" = "activate";
          "on-scroll-up" = "hyprctl dispatch workspace e-1";
          "on-scroll-down" = "hyprctl dispatch workspace e+1";
          "format-icons" = {
            "active" = "";
            "default" = "";
            "empty" = "";
          };
          "persistent-workspaces" = {
            "1" = [ ];
            "2" = [ ];
            "3" = [ ];
            "4" = [ ];
            "5" = [ ];
          };
        };

        "custom/sep" = {
          #"format" = "──";
          "format" = "";
        };

        "clock" = {
          "tooltip" = true;
          "format" = "{:%H\n%M}";
          "tooltip-format" = "{:%Y-%m-%d}";
        };

        "custom/notification" = {
          "rotate" = 90;
          "tooltip" = false;
          "format" = "{icon}";
          "format-icons" = {
            "notification" = "<span foreground='red'><sup></sup></span>";
            "none" = "";
            "dnd-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-none" = "";
            "inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "inhibited-none" = "";
            "dnd-inhibited-notification" = "<span foreground='red'><sup></sup></span>";
            "dnd-inhibited-none" = "";
          };
          "return-type" = "json";
          "exec-if" = "which swaync-client";
          "exec" = "swaync-client -swb";
          "on-click" = "swaync-client -t -sw";
          "on-click-right" = "swaync-client -d -sw";
          "escape" = true;
        };

        "pulseaudio" = {
          "rotate" = 90;
          "on-click" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "on-click-right" = "pavucontrol";
          "tooltip" = false;
          "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-source" = "";
          "format-source-muted" = "";
          "format-bluetooth" = "{icon} {volume}%";
          "format-bluetooth-muted" = "   {volume}%";
          "format-muted" = "<span>  MUTE</span>";
          "format-icons" = {
            "headphone" = " ";
            "hands-free" = " ";
            "headset" = " ";
            "phone" = " ";
            "portable" = " ";
            "car" = " ";
            "default" = [
              " "
            ];
          };
        };

        "network" = {
          "rotate" = 90;
          "interface" = "wlo1";
          "format" = "{ifname}";
          "format-wifi" = "<span> </span>";
          "format-ethernet" = "{ipaddr}/{cidr} ";
          "format-disconnected" = "<span>󰖪 </span>No Network";
          "tooltip" = false;
          "on-click" = "kitty nmtui";
        };

        "bluetooth" = {
          "format-on" = "󰂯";
          "format-off" = "BT-off";
          "format-disabled" = "󰂲";
          "format-connected-battery" = "{device_battery_percentage}% 󰂯";
          "format-alt" = "{device_alias} 󰂯";
          "tooltip-format" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          "tooltip-format-connected" =
            "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}\n{device_address}";
          "tooltip-format-enumerate-connected-battery" =
            "{device_alias}\n{device_address}\n{device_battery_percentage}%";
          "on-click-right" = "blueman-manager";
        };

        "battery" = {
          "interval" = 30;
          "states" = {
            "good" = 95;
            "warning" = 30;
            "critical" = 20;
          };
          "format" = "{capacity}% {icon}";
          "format-charging" = "{capacity}% 󰂄";
          "format-plugged" = "{capacity}% 󰂄 ";
          "format-alt" = "{time} {icon}";
          format-icons = [
            "󰁻"
            "󰁼"
            "󰁾"
            "󰂀"
            "󰂂"
            "󰁹"
          ];
        };

        "cpu" = {
          "format" = "󰻠";
          "tooltip" = true;
        };

        "temperature" = {
          "critical-threshold" = 80;
          "format" = "";
        };

        "memory" = {
          "format" = "󰋊";
        };

        "custom/expand" = {
          "format" = "";
          "tooltip" = false;
        };

        "tray" = {
          "icon-size" = 18;
          "show-passive-items" = true;
          "tooltip" = true;
        };

        "custom/power" = {
          "format" = "<span color='#fb4833'>⏻</span>";
          "on-click" = "~/nixos-config/home-manager/modules/hyprland/scripts/powermenu.sh";
        };
      }
    ];
  };
}
