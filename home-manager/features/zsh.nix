{
  pkgs,
  config,
  lib,
  home,
  ...
}: {

  programs.zsh = {
    enable = true;
    syntaxHighlighting = {
      enable = true;
      highlighters = [
        "main"
        "brackets"
        "regexp"
        "root"
        "line"
      ];
    };
    enableAutosuggestions = true;
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
        "common-aliases"
        "aliases"
        "zoxide"
        "tmuxinator"
      ];
    };
  };


  home.packages = with pkgs; [
    fzf
    thefuck
    zoxide
    direnv
    tmuxinator
    zoxide
    tmux-cssh
  ];


}
