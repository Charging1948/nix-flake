{config, ...}: {
  programs.zathura = {
    enable = true;
    options = with config.colorScheme.palette; {
      selection-clipboard = "clipboard";
      # font = "${config.fontProfiles.regular.family} 12";
      recolor = true;
      default-bg = "#${base00}";
      default-fg = "#${base01}";
      statusbar-bg = "#${base02}";
      statusbar-fg = "#${base04}";
      inputbar-bg = "#${base00}";
      inputbar-fg = "#${base07}";
      notification-bg = "#${base00}";
      notification-fg = "#${base07}";
      notification-error-bg = "#${base00}";
      notification-error-fg = "#${base08}";
      notification-warning-bg = "#${base00}";
      notification-warning-fg = "#${base08}";
      highlight-color = "#${base0A}";
      highlight-active-color = "#${base0D}";
      completion-bg = "#${base01}";
      completion-fg = "#${base05}";
      completions-highlight-bg = "#${base0D}";
      completions-highlight-fg = "#${base07}";
      recolor-lightcolor = "#${base00}";
      recolor-darkcolor = "#${base06}";
    };
  };
}
