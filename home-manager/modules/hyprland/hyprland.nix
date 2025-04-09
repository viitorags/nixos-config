{
    wayland.windowManager.hyprland = {
        enable = true;
        
        xwayland = {
            enable = true;
        };

        settings = {
            monitor = ",preferred,auto,auto";

            "$terminal" = "kitty";
            "$fileManager" = "dolphin";
            "$menu" = "wofi -show drun";
            "$browser" = "firefox";

            exec-once = [
                "systemctl --user start hyprpolkitagent"
                "hyprpaper"
                "waybar"
                "swaync"
                "wl-paste --type text --watch cliphist store"
                "wl-past --type image --watch cliphist store"
                "hyprctl setcursor Bibata-Original-Ice 24"
                # ''dconf write /org/gnome/desktop/interface/cursor-theme "'Bibata-Original-Ice'"''
                # ''dconf write /org/gnome/desktop/interface/font-name "'JetBrainsMono Regular"''
            ];

            env = [
                "XCURSOR_SIZE,24"
                "XCURSOR_THEME,Bibata-Original-Ice"
                "HYPRCURSOR_SIZE,24"
                "HYPRCURSOR_THEME,Bibata-Original-Ice"
                "XDG_CURRENT_DESKTOP,Hyprland"
                "XDG_SESSION_TYPE,wayland"
                "XDG_SESSION_DESKTOP,Hyprland"
                "GDK_BACKEND,wayland,x11,*"
                "SDL_VIDEO_DRIVER,wayland"
                "MOZ_ENABLE_WAYLAND,1"
                "QT_AUTO_SCREEN_SCALE_FACTOR,1"
                "QT_QPA_PLATFORM,wayland;xcb"
                "QT_QPA_PLATFORMTHEME,qt5ct"
                # "QT_STYLE_OVERRIDE,qt5ct"
                "XDG_MENU_PREFIX,arch-"
            ];

            general = {
                gaps_in = 3;
                gaps_out = 5;

                border_size = 0;

                #"col.active_border" = "rgba(7aa2f7aa)";
                #"col.inactive_border" = "rgba(414868aa)";

                resize_on_border = false;

                allow_tearing = false;

                layout = "dwindle";
            };

            decoration = {
                rounding = 10;
                # roundingpower = 2;

                active_opacity = 0.9;
                inactive_opacity = 0.9;

                fullscreen_opacity = 0.9;

                shadow = {
                    enabled = false;
                    range = 4;
                    render_power = 3;
                    "color" = "rgba(1a1a1aee)";
                };

                blur = {
                    enabled = true;
                    size = 2;
                    passes = 2;
                    # blursls waybar
                    vibrancy = 0.1696;
                };
            };

            misc = {
                disable_hyprland_logo = true;
                disable_splash_rendering = true;
	            vfr = true;
            };


            animations = {
                enabled = true;


                bezier = "myBezier, 0.5, 0.9, 0.1, 1.05";

                animation = [
                    "border, 1, 10, default"
                    "windows, 1, 7, myBezier"
                    "windowsOut, 1, 10, default, popin 80%"
                    "fade, 1, 10, default"
                    "workspaces, 1, 6, default"
                ];
            };


            dwindle = {
                pseudotile = true; # Master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
                preserve_split = true; # You probably want this
            };

            master = {
                new_status = "master";
            };

            input = {
                kb_layout = "br";
                # kb_variant = "lang";

                follow_mouse = 1;

                sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

                touchpad = {
                    natural_scroll = false;
                    disable_while_typing = false;
                };
            };

            gestures = {
                workspace_swipe = false;
            };

            device = {
                name = "epic-mouse-v1";
                sensitivity = -0.5;
            };


            "$mainMod" = "SUPER"; # Sets "Windows" key as main modifier
            bind = [
                "$mainMod, RETURN, exec, $terminal"
                "$mainMod, Q, killactive,"
                "$mainMod SHIFT, M, exit,"
                "$mainMod, E, exec, $fileManager"
                "$mainMod, T, togglefloating"
                "$mainMod, R, fullscreen"
                "$mainMod, A, exec, $menu"
                "$mainMod, P, pseudo, # dwindle"
                "$mainMod, J, togglesplit, # dwindle"
                "$mainMod, F, exec, $browser"
                "$mainMod SHIFT, F, exec, firefox -private-window"
                "$mainMod, C, exec, kitty -e zsh -ic nvim"
                "$mainMod, W, exec, waypaper"
                "$mainMod, B, exec, pkill waybar || waybar &"
                "$mainMod, L, exec, wlogout"
                "$mainMod, V, exec, cliphist list | wofi --show dmenu | cliphist decode | wl-copy"
                # Capturas de tela
                ", insert, exec, grim $(xdg-user-dir)/Imagens/Screenshots/$(date +'%s_grim.png')"
                ''CTRL SHIFT, insert, exec, grim -g "$(slurp)" $(xdg-user-dir)/Imagens/Screenshots/$(date +'%s_grim.png')''

                # Move focus with mainMod + arrow keys
                "$mainMod, left, movefocus, l"
                "$mainMod, right, movefocus, r"
                "$mainMod, up, movefocus, u"
                "$mainMod, down, movefocus, d"

                # Switch workspaces with mainMod + [0-9]
                "$mainMod, 1, workspace, 1"
                "$mainMod, 2, workspace, 2"
                "$mainMod, 3, workspace, 3"
                "$mainMod, 4, workspace, 4"
                "$mainMod, 5, workspace, 5"
                "$mainMod, 6, workspace, 6"
                "$mainMod, 7, workspace, 7"
                "$mainMod, 8, workspace, 8"
                "$mainMod, 9, workspace, 9"
                "$mainMod, 0, workspace, 10"

                # Move active window to a workspace with mainMod + SHIFT + [0-9]
                "$mainMod SHIFT, 1, movetoworkspace, 1"
                "$mainMod SHIFT, 2, movetoworkspace, 2"
                "$mainMod SHIFT, 3, movetoworkspace, 3"
                "$mainMod SHIFT, 4, movetoworkspace, 4"
                "$mainMod SHIFT, 5, movetoworkspace, 5"
                "$mainMod SHIFT, 6, movetoworkspace, 6"
                "$mainMod SHIFT, 7, movetoworkspace, 7"
                "$mainMod SHIFT, 8, movetoworkspace, 8"
                "$mainMod SHIFT, 9, movetoworkspace, 9"
                "$mainMod SHIFT, 0, movetoworkspace, 10"

                # Example special workspace (scratchpad)
                "$mainMod, S, togglespecialworkspace, magic"
                "$mainMod SHIFT, S, movetoworkspace, special:magic"

                # Scroll through existing workspaces with mainMod + scroll
                "$mainMod, mouse_down, workspace, e+1"
                "$mainMod, mouse_up, workspace, e-1"
            ];
            
            # Move/resize windows with mainMod + LMB/RMB and dragging
            bindm = [
                "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
            ];

            windowrule = [
                "bordersize 2, floating:0, onworkspace:w[tv1]"
                "rounding 10, floating:0, onworkspace:w[tv1]"
                "bordersize 2, floating:0, onworkspace:f[1]"
                "rounding 10, floating:0, onworkspace:f[1]"

                # Ignore maximize requests from apps. You'll probably like this.
                "suppressevent maximize, class:.*"

                # Fix some dragging issues with XWayland
                "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
            ];
        };
    };
}
