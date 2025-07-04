{ config, pkgs, ... }:
{
  programs.btop = {
    enable = true;

    themes = {
      gruvbox-material = ''
        theme[main_bg]="#32302f"
        theme[main_fg]="#d4be98"
        theme[title]="#d4be98"
        theme[hi_fg]="#ea6962"
        theme[selected_bg]="#d8a657"
        theme[selected_fg]="#282828"
        theme[inactive_fg]="#282828"
        theme[graph_text]="#665c54"
        theme[proc_misc]="#a9b665"
        theme[cpu_box]="#7c6f64"
        theme[mem_box]="#7c6f64"
        theme[net_box]="#7c6f64"
        theme[proc_box]="#7c6f64"
        theme[div_line]="#7c6f64"
        theme[temp_start]="#7daea3"
        theme[temp_mid]="#e78a4e"
        theme[temp_end]="#ea6962"
        theme[cpu_start]="#a9b665"
        theme[cpu_mid]="#d8a657"
        theme[cpu_end]="#ea6962"
        theme[free_start]="#89b482"
        theme[free_mid]=""
        theme[free_end]=""
        theme[cached_start]="#7daea3"
        theme[cached_mid]=""
        theme[cached_end]=""
        theme[available_start]="#d8a657"
        theme[available_mid]=""
        theme[available_end]=""
        theme[used_start]="#ea6962"
        theme[used_mid]=""
        theme[used_end]=""
        theme[download_start]="#e78a4e"
        theme[download_mid]=""
        theme[download_end]=""
        theme[upload_start]="#d3869b"
        theme[upload_mid]=""
        theme[upload_end]=""
      '';
    };

    settings = {
      color_theme = "gruvbox-material";

      truecolor = true;

      net_iface = "";

      shown_boxes = "cpu mem proc";

    };
  };
}
