{
  programs.btop = {
    enable = true;

    themes = {
      catppuccin-macchiato = ''
        theme[main_bg]="#24273a"

        theme[main_fg]="#cad3f5"

        theme[title]="#cad3f5"

        theme[hi_fg]="#8aadf4"

        theme[selected_bg]="#494d64"

        theme[selected_fg]="#8aadf4"

        theme[inactive_fg]="#8087a2"

        theme[graph_text]="#f4dbd6"

        theme[meter_bg]="#494d64"

        theme[proc_misc]="#f4dbd6"

        theme[cpu_box]="#c6a0f6" #Mauve
        theme[mem_box]="#a6da95" #Green
        theme[net_box]="#ee99a0" #Maroon
        theme[proc_box]="#8aadf4" #Blue

        theme[div_line]="#6e738d"

        theme[temp_start]="#a6da95"
        theme[temp_mid]="#eed49f"
        theme[temp_end]="#ed8796"

        theme[cpu_start]="#8bd5ca"
        theme[cpu_mid]="#7dc4e4"
        theme[cpu_end]="#b7bdf8"

        theme[free_start]="#c6a0f6"
        theme[free_mid]="#b7bdf8"
        theme[free_end]="#8aadf4"

        theme[cached_start]="#7dc4e4"
        theme[cached_mid]="#8aadf4"
        theme[cached_end]="#b7bdf8"

        theme[available_start]="#f5a97f"
        theme[available_mid]="#ee99a0"
        theme[available_end]="#ed8796"

        theme[used_start]="#a6da95"
        theme[used_mid]="#8bd5ca"
        theme[used_end]="#91d7e3"

        theme[download_start]="#f5a97f"
        theme[download_mid]="#ee99a0"
        theme[download_end]="#ed8796"

        theme[upload_start]="#a6da95"
        theme[upload_mid]="#8bd5ca"
        theme[upload_end]="#91d7e3"

        theme[process_start]="#7dc4e4"
        theme[process_mid]="#b7bdf8"
        theme[process_end]="#c6a0f6"
      '';
    };

    settings = {
      color_theme = "catppuccin-macchiato";

      truecolor = true;

      net_iface = "";

      shown_boxes = "cpu mem proc";

    };
  };
}
