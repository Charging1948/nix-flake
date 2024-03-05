{
  config,
  pkgs,
  ...
}: {
  programs.swaylock = {
    enable = true;
    package = pkgs.unstable.swaylock;
    settings = with config.colorScheme.palette; {
      effect-blur = "20x3";
      fade-in = 0.2;

      # font = config.fontProfiles.regular.family;
      font-size = 15;

      line-uses-inside = true;
      disable-caps-lock-text = true;
      indicator-caps-lock = true;
      indicator-radius = 20;
      indicator-idle-visible = true;
      indicator-y-position = 1200;

      ring-color = "#${base02}";
      inside-wrong-color = "#${base08}";
      ring-wrong-color = "#${base08}";
      key-hl-color = "#${base0B}";
      bs-hl-color = "#${base08}";
      ring-ver-color = "#${base09}";
      inside-ver-color = "#${base09}";
      inside-color = "#${base01}";
      text-color = "#${base07}";
      text-clear-color = "#${base01}";
      text-ver-color = "#${base01}";
      text-wrong-color = "#${base01}";
      text-caps-lock-color = "#${base07}";
      inside-clear-color = "#${base0C}";
      ring-clear-color = "#${base0C}";
      inside-caps-lock-color = "#${base09}";
      ring-caps-lock-color = "#${base02}";
      separator-color = "#${base02}";
    };
  };
}
