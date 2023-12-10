{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    ohMyZsh = {
      enable = true;
      plugins = [
        "git"
        "thefuck"
        "direnv"
        "docker"
        "docker-compose"
        "fzf"
        "tmux"
        "zoxide"
        "magic-enter"
        "colored-man-pages"
        "podman"
      ];
    };
  };
}
