{
  programs.fastfetch = {
    enable = true;

    settings = {
      logo = {
        source = "$(find \"$HOME/nixos-config/home/modules/programs/fastfetch/pngs/\" -name \"*.png\" | sort -R | head -1)";
        type = "kitty";
        height = 17;
        padding = {
          top = 1;
        };
      };

      "display" = {
        "separator" = " ";
      };
      "modules" = [
        "break"
        "break"
        {
          "type" = "custom";
          "format" = "{#90}  {#31}  {#33}  {#33}  {#34}  {#35}  {#36}  {#37} ";
        }
        {
          "type" = "title";
          "keyWidth" = 10;
        }
        {
          type = "os";
          key = "  OS";
          keyColor = "34";
        }
        {
          "type" = "kernel";
          "key" = " ";
          "keyColor" = "34";
        }
        {
          "type" = "packages";
          "format" = "{} (pacman)";
          "key" = " ";
          "keyColor" = "34";
        }
        {
          "type" = "shell";
          "key" = " ";
          "keyColor" = "34";
        }
        {
          "type" = "terminal";
          "key" = " ";
          "keyColor" = "34";
        }
        {
          "type" = "wm";
          "key" = " ";
          "keyColor" = "34";
        }
        {
          "type" = "cursor";
          "key" = " ";
          "keyColor" = "34";
        }
        {
          "type" = "terminalfont";
          "key" = " ";
          "keyColor" = "34";
        }
        {
          "type" = "uptime";
          "key" = " ";
          "keyColor" = "34";
        }
        {
          "type" = "datetime";
          "format" = "{1}-{3}-{11}";
          "key" = " ";
          "keyColor" = "34";
        }
        {
          "type" = "media";
          "key" = "󰝚 ";
          "keyColor" = "34";
        }
        {
          "type" = "player";
          "key" = " ";
          "keyColor" = "34";
        }
        "break"
        {
          "type" = "custom";
          "format" = "{#90}  {#31}  {#33}  {#33}  {#34}  {#35}  {#36}  {#37} ";
        }
        "break"
        "break"
      ];
    };
  };
}
