{
  programs.waybar = {
    enable = true;
    settings = [
      {
        "layer" = "top";
        "position" = "top";
        "width" = 1374;
        "height" = 35;
        "margin-top" = 5;
        "margin-bottom" = 0;
        "modules-left" = [ "custom/distro" "hyprland/workspaces" "tray" ];
        "modules-center" = [ "clock" ];
        "modules-right" = [ "group/expand" "pulseaudio" "network" "custom/notification" ];

        "custom/distro" = {
          "format" = " ";
          "on-click" = "pkill rofi || rofi -show drun";
          "on-click-release" = "sleep 0";
        };

        "hyprland/workspaces" = {
          "format" = "{icon}";
          "disable-scroll" = true;
          "all-outputs" = true;
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

        "clock" = {
          "format" = " {:%A, %d %b, %H:%M %p}";
          "tooltip-format" = "<tt>{calendar}</tt>";
            "calendar" = {
                "format" = {
                    "today" = "<span color='#fAfBfC'><b>{}</b></span>";
                };
            };
            "actions" = {
                "on-click-right" = "shift_down";
                "on-click" = "shift_up";
            };
        };

        "custom/notification" = {
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

        "backlight" = {
          "device" = "amdgpu_b10";
          "format" = "<span>{icon}</span>{percent}%";
          "format-icons" = [ "󰃞 " "󰃟 " "󰃠 " ];
        };

        "pulseaudio" = {
          "on-click" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          "on-click-right" = "pavucontrol";
          "tooltip" = false;
          "scroll-step" = 1;
          "format" = "{icon}  {volume}%";
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
          "tooltip-format-connected" = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          "tooltip-format-enumerate-connected" = "{device_alias}\n{device_address}";
          "tooltip-format-enumerate-connected-battery" = "{device_alias}\n{device_address}\n{device_battery_percentage}%";
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
            "format" = "󰍛";
        };

        "custom/expand" = {
            "format" = "";
            "tooltip" = false;
        };

        "group/expand" = {
          "orientation" = "horizontal";
          "drawer" = {
            "transition-duration" = 600;
            "transition-to-left" = true;
            "click-to-reveal" = true;
          };
          "modules" = [ "custom/expand" "cpu" "memory" "temperature" ];
        };

        "tray" = {
          "icon-size" = 14;
          "spacing" = 10;
          "show-passive-items" = true;
        };

        "custom/power" = {
          "format" = "<span color='#fb4833'>⏻</span>";
          "on-click" = "wlogout";
        };
      }
    ];

    style = ''
      @import url('../../.cache/wal/colors-waybar.css');

      * {
          font-size:15px;
          font-family: "CodeNewRoman Nerd Font Propo";
      }
      window#waybar{
          all:unset;
      }
      .modules-left {
          padding:7px;
          margin:5 0 5 10;
          border-radius:10px;
          background: alpha(@background,.6);
          box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }
      .modules-center {
          padding:7px;
          margin:5 0 5 0;
          border-radius:10px;
          background: alpha(@background,.6);
          box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }
      .modules-right {
          padding:7px;
          margin: 5 10 5 0;
          border-radius:10px;
          background: alpha(@background,.6);
          box-shadow: 0px 0px 2px rgba(0, 0, 0, .6);
      }
      tooltip {
          background:@background;
          color: @color7;
      }
      #clock:hover, #custom-distro:hover, #custom-notification:hover,#bluetooth:hover,#network:hover,#battery:hover, #cpu:hover,#memory:hover,#temperature:hover{
          transition: all .3s ease;
          color:@color9;
      }
      #custom-notification {
          padding: 0px 5px;
          transition: all .3s ease;
          color:@color7;
      }
      #clock{
          padding: 0px 5px;
          color:@color7;
          transition: all .3s ease;
      }
      #custom-distro{
          padding: 0px 5px;
          transition: all .3s ease;
          color:@color7;

      }
      #workspaces {
          padding: 0px 5px;
      }
      #workspaces button {
          all:unset;
          padding: 0px 5px;
          color: alpha(@color9,.4);
          transition: all .2s ease;
      }
      #workspaces button:hover {
          color: @color9;
          border: none;
          text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
      }
      #workspaces button.empty {
          color: rgba(0,0,0,0);
          border: none;
          text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .2);
      }
      #workspaces button.empty:hover {
          color: rgba(0,0,0,0);
          border: none;
          text-shadow: 0px 0px 1.5px rgba(0, 0, 0, .5);
          transition: all 1s ease;
      }
      #workspaces button.empty.active {
          color: @color9;
          border: none;
          text-shadow: 0px 0px 2px rgba(0, 0, 0, .5);
      }
      #bluetooth{
          padding: 0px 5px;
          transition: all .3s ease;
          color:@color7;

      }
      #pulseaudio{
          padding: 0px 5px;
          transition: all .3s ease;
          color:@color7;
      }
      #network{
          padding: 0px 5px;
          transition: all .3s ease;
          color:@color7;

      }
      #battery{
          padding: 0px 5px;
          transition: all .3s ease;
          color:@color7;


      }
      #battery.charging {
          color: #26A65B;
      }

      #battery.warning:not(.charging) {
          color: #ffbe61;
      }

      #battery.critical:not(.charging) {
          color: #f53c3c;
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }
      #group-expand{
          padding: 0px 5px;
          transition: all .3s ease; 
      }
      #custom-expand{
          padding: 0px 5px;
          color:alpha(@foreground,.2);
          text-shadow: 0px 0px 2px rgba(0, 0, 0, .7);
          transition: all .3s ease; 
      }
      #custom-expand:hover{
          color:rgba(255,255,255,.2);
          text-shadow: 0px 0px 2px rgba(255, 255, 255, .5);
      }
      #custom-colorpicker{
          padding: 0px 5px;
      }
      #cpu,#memory,#temperature{
          padding: 0px 5px;
          margin-right: 5px;
          transition: all .3s ease; 
          color:@color7;

      }
      #custom-endpoint{
          color:transparent;
          text-shadow: 0px 0px 1.5px rgba(0, 0, 0, 1);

      }
      #tray{
          padding: 0px 5px;
          transition: all .3s ease; 

      }
      #tray menu * {
          padding: 0px 5px;
          transition: all .3s ease; 
      }

      #tray menu separator {
          padding: 0px 5px;
          transition: all .3s ease; 
      }
    '';
  };

}
