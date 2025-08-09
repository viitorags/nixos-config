{
  programs.btop = {
    enable = true;

    themes = {
      kanagawa = ''
        theme[main_bg]="#1f1f28"         # bg
        theme[main_fg]="#dcd7ba"         # fg

        theme[title]="#dcd7ba"           # fg

        theme[hi_fg]="#7e9cd8"           # blue

        theme[selected_bg]="#2a2a37"     # bg2
        theme[selected_fg]="#7e9cd8"     # blue

        theme[inactive_fg]="#727169"     # grey

        theme[graph_text]="#c0a36e"      # yellow

        theme[meter_bg]="#2a2a37"        # bg2

        theme[proc_misc]="#c0a36e"       # yellow

        theme[cpu_box]="#957fb8"         # magenta
        theme[mem_box]="#76946a"         # green
        theme[net_box]="#c34043"         # red
        theme[proc_box]="#7e9cd8"        # blue

        theme[div_line]="#54546d"        # border grey

        theme[temp_start]="#76946a"      # green
        theme[temp_mid]="#c0a36e"        # yellow
        theme[temp_end]="#c34043"        # red

        theme[cpu_start]="#6a9589"       # cyan
        theme[cpu_mid]="#7e9cd8"         # blue
        theme[cpu_end]="#957fb8"         # magenta

        theme[free_start]="#957fb8"      # magenta
        theme[free_mid]="#a3a6c1"        # soft lavender-grey
        theme[free_end]="#7e9cd8"        # blue

        theme[cached_start]="#7e9cd8"    # blue
        theme[cached_mid]="#9cabca"      # light blue-grey
        theme[cached_end]="#a3a6c1"      # soft lavender-grey

        theme[available_start]="#ffa066" # orange
        theme[available_mid]="#c0a36e"   # yellow
        theme[available_end]="#c34043"   # red

        theme[used_start]="#76946a"      # green
        theme[used_mid]="#6a9589"        # cyan
        theme[used_end]="#7e9cd8"        # blue

        theme[download_start]="#ffa066"  # orange
        theme[download_mid]="#c0a36e"    # yellow
        theme[download_end]="#c34043"    # red

        theme[upload_start]="#76946a"    # green
        theme[upload_mid]="#6a9589"      # cyan
        theme[upload_end]="#7e9cd8"      # blue

        theme[process_start]="#7e9cd8"   # blue
        theme[process_mid]="#a3a6c1"     # soft lavender-grey
        theme[process_end]="#957fb8"     # magenta
      '';
    };

    settings = {
      color_theme = "kanagawa";

      truecolor = true;

      net_iface = "";

      shown_boxes = "cpu mem proc";

    };
  };
}
