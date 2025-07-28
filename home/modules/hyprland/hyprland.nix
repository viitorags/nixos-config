{
  wayland.windowManager.hyprland = {
    enable = true;

    xwayland = {
      enable = true;
    };

    #systemd.variables = ["--all"];

    settings = {
      monitor = ",preferred,auto,auto";

      "$terminal" = "wezterm start";
      "$fileManager" = "wezterm start -- yazi";
      "$menu" = "bash -c ~/nixos-config/home/modules/hyprland/scripts/launcher.sh";
      "$browser" = "brave";
      "$editor" = "wezterm -e zsh -ic nvim";

      exec-once = [
        "dbus-update-activation-environment --systemd --all"
        "systemctl --user start hyprpolkitagent.service"
        "eval $(gnome-keyring-daemon --start --components=pkcs11,secrets,ssh,gpg)"
        "swww-daemon"
        "waybar &"
        "swaync"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "hyprctl setcursor Capitaine Cursors (Gruvbox) 24"
        # ''dconf write /org/gnome/desktop/interface/cursor-theme "'Capitaine Cursors (Gruvbox)'"''
      ];

      env = [
        "SSH_AUTH_SOCK,/run/user/1000/keyring/ssh"
        "XCURSOR_SIZE,24"
        "XCURSOR_THEME,Capitaine Cursors (Gruvbox)"
        "HYPRCURSOR_SIZE,24"
        "HYPRCURSOR_THEME,Capitaine Cursors (Gruvbox)"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        "GDK_BACKEND,wayland,x11,*"
        "SDL_VIDEO_DRIVER,wayland"
        "MOZ_ENABLE_WAYLAND,1"
        "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        "QT_QPA_PLATFORM,wayland;xcb"
        "QT_QPA_PLATFORMTHEME,qt5ct"
        "XDG_MENU_PREFIX,arch-"
      ];

      misc = {
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
        vfr = true;
      };

      animations = {
        enabled = true;
        first_launch_animation = true;

        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "linear, 1, 1, 1, 1"
          "Cubic, 0.1, 0.1, 0.1, 1"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "ease-in-out, 0.17, 0.67, 0.83, 0.67"
          "ease-in, 0.17, 0.67, 0.83, 0.67"
          "ease-out, 0.42, 0, 1, 1"
          "easeInOutSine, 0.37, 0, 0.63, 1"
          "easeInSine, 0.12, 0, 0.39, 0"
          "easeOutSine, 0.61, 1, 0.88, 1"
        ];

        animation = [
          "windowsIn, 1, 3, easeInOutSine, popin"
          "windowsOut, 1, 3, easeInOutSine, popin"

          "border, 1, 3, easeInOutSine"
          "borderangle, 1, 30, easeInOutSine, loop"

          "workspacesIn, 1, 3, easeInOutSine, slidefade"
          "workspacesOut, 1, 3, easeInOutSine, slidefade"

          "specialWorkspaceIn, 1, 3, easeInOutSine, slidevert"
          "specialWorkspaceOut, 1, 3, easeInOutSine, slidevert"

          "layersIn, 1, 3, easeInOutSine, fade"
          "layersOut, 1, 3, easeInOutSine, fade"
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
        "$mainMod SHIFT, Return, exec, [float; move 15% 5%; size 70% 40%] $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod SHIFT, M, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, T, togglefloating"
        "$mainMod, R, fullscreen"
        "$mainMod, A, exec, $menu"
        "$mainMod, D, exec, GDK_BACKEND=x11 dbeaver"
        "$mainMod, L, exec, bash -c ~/nixos-config/home/modules/hyprland/scripts/powermenu.sh"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, J, togglesplit, # dwindle"
        "$mainMod, F, exec, $browser"
        "$mainMod SHIFT, F, exec, brave --incognito"
        "$mainMod, C, exec, $editor"
        "bind=$mainMod SHIFT, C, exec, [float; move 15% 5%; size 70% 90%] $editor"
        "$mainMod, W, exec, bash -ic '~/nixos-config/home/modules/hyprland/scripts/wallpaper_change.sh'"
        "$mainMod, B, exec, pkill waybar || waybar"
        "$mainMod, L, exec, wlogout"
        "$mainMod, V, exec, bash -c ~/nixos-config/home/modules/hyprland/scripts/clipboard.sh"
        ", insert, exec, bash -c ~/nixos-config/home/modules/hyprland/scripts/screenshot.sh"
        #", insert, exec, grim $(xdg-user-dir)/Pictures/Screenshots/$(date +'%s_grim.png')"
        ''CTRL SHIFT, insert, exec, grim -g "$(slurp)" $(xdg-user-dir)/Pictures/Screenshots/$(date +'%s_grim.png')''

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
        "opacity 0.90 0.90, class:^(Rofi)$"
        "noblur, class:^(Brave-browser)$"
        # Ignore maximize requests from apps. You'll probably like this.
        "suppressevent maximize, class:.*"

        # Fix some dragging issues with XWayland
        "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
      ];

      layerrule = [
        "blur,rofi"
        "ignorezero,rofi"
        "blur, waybar"
        "blur, swaync-control-center"
        "blur, swaync-notification-window"
        "blur, waybar"
        "ignorezero, waybar"
        "ignorezero, swaync-control-center"
        "ignorezero, swaync-notification-window"
        "ignorealpha 0.5, swaync-control-center"
        "ignorealpha 0.5, swaync-notification-window"
      ];
    };

    extraConfig = ''
      general {
          gaps_in = 3
          gaps_out = 5

          border_size = 2

          col.active_border = rgba(d79921ff)
          col.inactive_border = rgba(414868aa)

          resize_on_border = true

          allow_tearing = false

          layout = dwindle
      }

      decoration {
        rounding = 0
        rounding_power = 0

        active_opacity = 0.8
        inactive_opacity = 0.7

        fullscreen_opacity = 1

        shadow {
          enabled = false
          range = 4
          render_power = 3
          color = rgba(1a1a1aee)
        }
          
        blur {
          enabled = true
          size = 2
          passes = 5
          vibrancy = 2
        }
      }
    '';
  };
}
