{
  pkgs,
  noctalia,
  ...
}:
{
  imports = [ noctalia.homeModules.default ];

  home = {
    packages = with pkgs; [
      (noctalia.packages.${system}.default.overrideAttrs (old: {
        buildInputs = [
          xkeyboard_config
          qt6.qtbase
        ];
      }))
    ];
  };

  programs.noctalia-shell = {
    enable = true;
    settings = {
      "appLauncher" = {
        "backgroundOpacity" = 1;
        "enableClipboardHistory" = true;
        "pinnedExecs" = [
        ];
        "position" = "center";
        "sortByMostUsed" = true;
        "useApp2Unit" = false;
      };
      "audio" = {
        "cavaFrameRate" = 60;
        "mprisBlacklist" = [
        ];
        "preferredPlayer" = "";
        "visualizerType" = "wave";
        "volumeOverdrive" = false;
        "volumeStep" = 5;
      };
      "bar" = {
        "backgroundOpacity" = 1;
        "density" = "comfortable";
        "floating" = false;
        "marginHorizontal" = 0.25;
        "marginVertical" = 0.25;
        "monitors" = [
        ];
        "position" = "left";
        "showCapsule" = true;
        "widgets" = {
          "center" = [
            {
              "hideUnoccupied" = false;
              "id" = "Workspace";
              "labelMode" = "none";
            }
            {
              "id" = "Spacer";
              "width" = 20;
            }
          ];
          "left" = [
            {
              "formatHorizontal" = "HH=mm ddd; MMM dd";
              "formatVertical" = "HH mm - dd MM";
              "id" = "Clock";
              "useMonospacedFont" = true;
              "usePrimaryColor" = true;
            }
            {
              "id" = "SystemMonitor";
              "showCpuTemp" = true;
              "showCpuUsage" = true;
              "showDiskUsage" = false;
              "showMemoryAsPercent" = false;
              "showMemoryUsage" = true;
              "showNetworkStats" = false;
            }
          ];
          "right" = [
            {
              "id" = "Tray";
            }
            {
              "id" = "WallpaperSelector";
            }
            {
              "id" = "ScreenRecorder";
            }
            {
              "hideWhenZero" = true;
              "id" = "NotificationHistory";
              "showUnreadBadge" = true;
            }
            {
              "id" = "Bluetooth";
            }
            {
              "id" = "WiFi";
            }
            {
              "displayMode" = "onhover";
              "id" = "Volume";
            }
            {
              "displayMode" = "onhover";
              "id" = "Brightness";
            }
            {
              "displayMode" = "onhover";
              "id" = "Battery";
              "warningThreshold" = 30;
            }
            {
              "customIconPath" = "";
              "icon" = "";
              "id" = "ControlCenter";
              "useDistroLogo" = true;
            }
          ];
        };
      };
      "brightness" = {
        "brightnessStep" = 5;
      };
      "colorSchemes" = {
        "darkMode" = true;
        "predefinedScheme" = "Kanagawa";
        "useWallpaperColors" = false;
      };
      "dock" = {
        "autoHide" = false;
        "backgroundOpacity" = 1;
        "exclusive" = false;
        "floatingRatio" = 1;
        "monitors" = [
        ];
        "pinnedApps" = [
        ];
      };
      "general" = {
        "animationSpeed" = 1;
        "avatarImage" = "/home/vitor/.face";
        "dimDesktop" = false;
        "forceBlackScreenCorners" = false;
        "radiusRatio" = 1;
        "screenRadiusRatio" = 0.9;
        "showScreenCorners" = true;
      };
      "hooks" = {
        "darkModeChange" = "";
        "enabled" = true;
        "wallpaperChange" = "cp $1 ~/.wallpaper";
      };
      "location" = {
        "name" = "Goiânia";
        "showWeekNumberInCalendar" = false;
        "use12hourFormat" = false;
        "useFahrenheit" = false;
      };
      "matugen" = {
        "enableUserTemplates" = false;
        "foot" = false;
        "fuzzel" = false;
        "ghostty" = false;
        "gtk3" = false;
        "gtk4" = false;
        "kitty" = false;
        "pywalfox" = false;
        "qt5" = false;
        "qt6" = false;
        "vesktop" = false;
      };
      "network" = {
        "bluetoothEnabled" = true;
        "wifiEnabled" = true;
      };
      "nightLight" = {
        "autoSchedule" = true;
        "dayTemp" = "6500";
        "enabled" = false;
        "forced" = false;
        "manualSunrise" = "06:30";
        "manualSunset" = "18:30";
        "nightTemp" = "4000";
      };
      "notifications" = {
        "alwaysOnTop" = false;
        "criticalUrgencyDuration" = 15;
        "doNotDisturb" = false;
        "enableOSD" = true;
        "lastSeenTs" = 1758755821000;
        "location" = "top_right";
        "lowUrgencyDuration" = 3;
        "monitors" = [
        ];
        "normalUrgencyDuration" = 8;
        "respectExpireTimeout" = false;
      };
      "screenRecorder" = {
        "audioCodec" = "opus";
        "audioSource" = "default_output";
        "colorRange" = "limited";
        "directory" = "/home/vitor/Videos";
        "frameRate" = 60;
        "quality" = "very_high";
        "showCursor" = true;
        "videoCodec" = "h264";
        "videoSource" = "portal";
      };
      "settingsVersion" = 1;
      "ui" = {
        "fontBillboard" = "DejaVu Sans";
        "fontDefault" = "Sarasa Gothic CL";
        "fontFixed" = "Sarasa Mono TC";
        "idleInhibitorEnabled" = false;
        "monitorsScaling" = [
          {
            "name" = "LVDS-1";
            "scale" = 0.85;
          }
        ];
      };
      "wallpaper" = {
        "directory" = "/home/vitor/Pictures/Wallpapers";
        "enableMultiMonitorDirectories" = false;
        "enabled" = true;
        "fillColor" = "#000000";
        "fillMode" = "crop";
        "monitors" = [
          {
            "directory" = "/home/vitor/Pictures/Wallpapers";
            "name" = "LVDS-1";
            "wallpaper" = "/home/vitor/.wallpaper";
          }
        ];
        "randomEnabled" = false;
        "randomIntervalSec" = 300;
        "setWallpaperOnAllMonitors" = true;
        "transitionDuration" = 1500;
        "transitionEdgeSmoothness" = 0.05;
        "transitionType" = "random";
      };
    };
  };
  xdg.configFile."noctalia/colors.json".source = ./colors.json;
}
