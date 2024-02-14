{
  pkgs,
  config,
  ...
}: let
  inherit (config.colorScheme) palette;
in {
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
    colors = {
      bright = {
        black = "0x${palette.base00}";
        blue = "0x${palette.base0D}";
        cyan = "0x${palette.base0C}";
        green = "0x${palette.base0B}";
        magenta = "0x${palette.base0E}";
        red = "0x${palette.base08}";
        white = "0x${palette.base06}";
        yellow = "0x${palette.base09}";
      };
      cursor = {
        cursor = "0x${palette.base06}";
        text = "0x${palette.base06}";
      };
      normal = {
        black = "0x${palette.base00}";
        blue = "0x${palette.base0D}";
        cyan = "0x${palette.base0C}";
        green = "0x${palette.base0B}";
        magenta = "0x${palette.base0E}";
        red = "0x${palette.base08}";
        white = "0x${palette.base06}";
        yellow = "0x${palette.base0A}";
      };
      primary = {
        background = "0x${palette.base00}";
        foreground = "0x${palette.base06}";
      };
    };
  };
}
