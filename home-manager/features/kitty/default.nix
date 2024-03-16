{config, ...}: let
  kitty-theme = "Catppuccin-Mocha";
in {
  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./configs/kitty.conf;
    theme = kitty-theme;
  };
}
