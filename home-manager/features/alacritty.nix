{
  pkgs,
  config,
  ...
}: 
let inherit (config.colorScheme) colors;
in {
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    colors = {
      bright = {
        black = "0x${colors.base00}";
        blue = "0x${colors.base0D}";
        cyan = "0x${colors.base0C}";
        green = "0x${colors.base0B}";
        magenta = "0x${colors.base0E}";
        red = "0x${colors.base08}";
        white = "0x${colors.base06}";
        yellow = "0x${colors.base09}";
      };
      cursor = {
        cursor = "0x${colors.base06}";
        text = "0x${colors.base06}";
      };
      normal = {
        black = "0x${colors.base00}";
        blue = "0x${colors.base0D}";
        cyan = "0x${colors.base0C}";
        green = "0x${colors.base0B}";
        magenta = "0x${colors.base0E}";
        red = "0x${colors.base08}";
        white = "0x${colors.base06}";
        yellow = "0x${colors.base0A}";
      };
      primary = {
        background = "0x${colors.base00}";
        foreground = "0x${colors.base06}";
      };
    };
  };
}
