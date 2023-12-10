{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    enableFishIntegration = true;
    enableBashIntegration = true;

    settings = with config.colorScheme.colors; {
      format = ''
        [┌───────────────────>](bold ${base0B})
        [│](bold ${base0B})$directory$rust$package
        [└─>](bold ${base0B}) '';
    };
  };
}
