{ config, ...}:

let
  kitty-theme = if config.darkmode then
    ## Dark Themes
     # "Ayu"
     # "Dracula"
     # "Gruvbox Material Dark Medium"
     "Gruvbox Material Dark Hard"
     # "Flatland"
     # "Kaolin Aurora"
     # "Kaolin Ocean"
     # "Monokai"
     # "Nord"
     # "Nova"
     # "Obsidian"
     # "PaperColor Dark"
     # "Obsidian"
     # "Solarized Dark"
     # "Spacemacs"
     else
    ## Light Themes
    # "Ayu Light"
    # "GitHub Light"
    "Gruvbox Material Light Hard"
    # "Material"
    # "Piatto Light"
    # "Solarized Light"
    # "Tomorrow"
    # "Spring"
; in
{
  programs.kitty = {
    enable = true;
    extraConfig = builtins.readFile ./configs/kitty.conf;
    theme = kitty-theme;
  };

}
