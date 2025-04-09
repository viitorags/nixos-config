{
    programs.wlogout = {
        enable = true;
        layout = [
            
            {
                label = "lock";
                action = "hyprlock";
                text = "Lock";
                keybind = "l";
            }
            {
                label = "reboot";
                action = "systemctl reboot";
                text = "Reboot";
                keybind = "r";
            }
            {
                label = "shutdown";
                action = "systemctl poweroff";
                text = "Shutdown";
                keybind = "s";
            }
            {
                label = "logout";
                action = "loginctl kill-session $XDG_SESSION_ID";
                text = "Logout";
                keybind = "e";
            }
            {
                label = "suspend";
                action = "systemctl suspend";
                text = "Suspend";
                keybind = "u";
            }
            {
                label = "hibernate";
                action = "systemctl hibernate";
                text = "Hibernate";
                keybind = "h";
            }
        ];

        style = ''
            * {
                background-image: none;
            }
            
            window {
              background: transparent;
            }

            button {
                background-color: #272727;
                border: none;
                outline: none;
                margin: 5px;
                border-radius: 10px;
                background-repeat: no-repeat;
                background-position: center;
                background-size: 20%;
                color: #d65c0d;
                box-shadow: none;
                transition: all 0.3s ease;
            }

            button:active, button:hover {
                background-color: #655b53;
                background-size: 22%;
                color: #ebdbb2;
                outline: none;
            }

            #lock {
                opacity: 0.9;
                background-image: url("/home/vitor/nix/home-manager/modules/hyprland/icons/lock.png");
            }

            #logout {
                opacity: 0.9;
                background-image: url("/home/vitor/nix/home-manager/modules/hyprland/icons/logout.png");
            }

            #suspend {
                opacity: 0.9;
                background-image: url("/home/vitor/nix/home-manager/modules/hyprland/icons/suspend.png");
            }

            #hibernate {
                opacity: 0.9;
                background-image: url("/home/vitor/nix/home-manager/modules/hyprland/icons/hibernate.png");
            }

            #shutdown {
                opacity: 0.9;
                background-image: url("/home/vitor/nix/home-manager/modules/hyprland/icons/shutdown.png");
            }

            #reboot {
                opacity: 0.9;
                background-image: url("/home/vitor/nix/home-manager/modules/hyprland/icons/reboot.png");
            }
        '';
    };
}
