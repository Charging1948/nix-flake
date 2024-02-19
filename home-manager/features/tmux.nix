{
  pkgs,
  config,
  inputs,
  ...
}: {
  programs.tmux = {
    enable = true;
    package = inputs.tmux-flake.packages.${pkgs.system}.tmux;
  };
}
