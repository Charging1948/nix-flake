{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
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
