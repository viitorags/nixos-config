{
    programs.yazi = {
        enable = true;

        settings = {
            log = {
                enabled = false;
            };

            manager = {
                show_hidden = true;
                sort_dir_first = true;
                sort_reverse = true;
            };

            preview = {
                image_filter = "ueberzug";
                image_quality = 90;
                tab_size = 1;
                max_width = 600;
                max_height = 900;
                cache_dir = "";
                ueberzug_scale = 1;
                ueberzug_offset = [
                    0
                    0
                    0
                    0
                ];
            };
        };
    };
}
