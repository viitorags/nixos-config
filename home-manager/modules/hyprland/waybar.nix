{
    programs.waybar = {
        enable = true;
        settings = [ 
            {
                "layer" = "top";
                "position" = "top";
                "width" = 1350;
                "height" = 30;
                "margin-top" = 5;
                "margin-bottom" = 0;
                "modules-left" = ["hyprland/workspaces"];
                "modules-center" = ["clock"];
                "modules-right" = ["custom/notification" "memory" "backlight" "pulseaudio" "battery" "network" "custom/power"];

                "hyprland/workspaces" = {
                    "format" = "{icon}";
                    "disable-scroll" = true;
                    "all-outputs" = true;
                    "active-only" = false;
                    "on-click" = "activate";
                    "on-scroll-up" = "hyprctl dispatch workspace e-1";
                    "on-scroll-down" = "hyprctl dispatch workspace e+1";
                    "format-icons" = {
                        "active" = "";
                        "default" = "<span color='#ebdbb2'></span>";
                        "urgent" = "";
                        "empty" = "";
                    };
                    "persistent-workspaces" = {
                        "1" = [];
                        "2" = [];
                        "3" = [];
                        "4" = [];
                        "5" = [];
                    };
                };

                "clock" = {
                   "format" = "{:%a; %d %b, %H:%M %p}";
                   "tooltip-format" = "<big>{ =%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
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
                    "format" = "<span color='#448488'>{icon}</span> {percent}%";
                    "format-icons" = [
                        "" "" "" "" "" "" "" "" ""
                    ];
                };

                "pulseaudio" = {
                    "on-click" = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
                    "on-click-right" = "pavucontrol";
                    "tooltip" = false;
                    "scroll-step" = 1;
                    "format" = "{icon} {volume}%";
                    "format-muted" = "<span color='#cc231c'>  MUTE</span>";
                    "format-icons" = {
                        "headphone" = " ";
                        "hands-free" = " ";
                        "headset" = " ";
                        "phone" = " ";
                        "portable" = " ";
                        "car" = " ";
                        "default" = [
                            #"<span color='#83a597'> </span>"
                            #"<span color='#83a597'> </span>"
                            "<span color='#83a597'> </span>"
                        ];
                    };
                };

                "network" = {
                    "interface" = "wlo1";
                    "format" = "{ifname}";
                    "format-wifi" = "<span color='#fabc2e'> </span>";
                    "format-ethernet" = "{ipaddr}/{cidr} ";
                    "format-disconnected" = "<span color='#b16185'>󰖪 </span>No Network";
                    "on-click" = "kitty nmtui";
                };

                "battery" = {
                    "format" = "<span color='#8ec07b'>{icon}</span> {capacity}%";
                    "format-icons" = [
                        "" "" "" "" "" "" "" "" "" "" ""
                    ];
                    "format-charging" = "<span color='#8ec07b'></span> {capacity}%";
                };

                "memory" = {
                    "format" = "<span foreground='#989719'>󰍛</span> {}%";
                    "on-click" = "kitty btop";
                };

                "custom/power" = {
                    "format" = "<span color='#fb4833'>⏻</span>";
                    "on-click" = "wlogout";
                };     
            }
        ];        

        style = ''

            * {
                border: none;
                font-family: 'JetBrains Mono';
                font-size: 14px;
                font-weight: 600;
                font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
                min-height: 10px;
                box-shadow: none;
            }

            .modules-right, .modules-center, .modules-left {
                background: transparent;
                padding-right: 10px;
                padding-left: 10px;
                border-radius: 10px;
                margin-right: 10px;
                margin-left: 10px;
            }

            window#waybar {
                background: #272727;
                margin-top: 4px;
                border-radius: 10px;
            }

            #workspaces {
                border-radius: 4px;
                margin-right: 5px;
            }

            #workspaces button {
                color: #665c54;
                background: none;
                padding: 0;
                margin-right: 5px;
            }

            #workspaces button:hover {
                color: #d65c0d;
            }

            #workspaces button.active {
                color: #d79920;
            } 

            #clock, #backlight, #custom-cava, #temperature, #cpu, #pulseaudio, #network, #battery , #tray, #memory ,#custom-playerctl, #custom-power #custom-notification{
                border-radius: 10px;
                color: #fbf1c7;
                padding-left: 8px;
                padding-right: 8px;
            }

            #custom-notification {
                font-size: 16px;
                padding-right: 8px;
                padding-left: 10px;
            }

            #custom-power {
                font-size: 20px;
            	padding-left: 8px;
            	padding-right: 10px;
            }

            @keyframes blink {
                to {
                    background-color: #ffffff;
                    color: black;
                }
            }

            #battery.warning:not(.charging) {
                background: #f38ba8;
                color: white;
                animation-name: blink;
                animation-duration: 0.5s;
                animation-timing-function: linear;
                animation-iteration-count: infinite;
                animation-direction: alternate;
            }

            /* #pulseaudio { */
            /*   font-size: 20px; */
            /* 	margin-left: 15px; */
            /* } */

            /* #pulseaudio { */
            /*   border-radius: 10px; */
            /*   background-color: #11111b; */
            /*   color: #cba6f7; */
            /*   margin-top: 15px; */
            /* 	margin-right: 15px; */
            /*   padding-top: 1px; */
            /*   padding-left: 10px; */
            /*   padding-right: 10px; */
            /* } */

        '';
    };
}
