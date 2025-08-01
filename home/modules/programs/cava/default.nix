{
  programs.cava = {
    enable = true;

    settings = {
      general.framerate = 60;
      general.autosens = 1;
      general.overshoot = 20;

      general.sensitivity = 100;

      general.bars = 0;
      general.bar_width = 3;
      general.bar_spacing = 2;

      general.lower_cutoff_freq = 50;
      general.higher_cutoff_freq = 10000;

      input.method = "pulse";
      input.source = "auto";

      output.method = "ncurses";

      output.channels = "stereo";

      output.raw_target = "/dev/stdout";

      output.data_format = "binary";

      output.bit_format = "16bit";

      output.ascii_max_range = 1000;

      output.bar_delimiter = 59;
      output.frame_delimiter = 10;

      color = {
        background = "'#1e2030'";
        foreground = "'#c6a0f6'";

        gradient = 1;
        gradient_count = 8;
        gradient_color_1 = "'#91d7e3'";
        gradient_color_2 = "'#7dc4e4'";
        gradient_color_3 = "'#8aadf4'";
        gradient_color_4 = "'#b7bdf8'";
        gradient_color_5 = "'#c6a0f6'";
        gradient_color_6 = "'#d7a8f0'";
        gradient_color_7 = "'#e0b2e6'";
        gradient_color_8 = "'#f0c6c6'";
      };

      smoothing.integral = 70;

      smoothing.monstercat = 1;
      smoothing.waves = 0;

      smoothing.gravity = 100;

      smoothing.ignore = 0;

      # eq = ["
      #     1 = 1 2 = 1 3 = 1 4 = 1 5 = 1"
      # ];
    };
  };
}
