{
  lib,
  config,
  ...
}: {
  imports = [
    ./mako.nix
    ./tmux.nix
    ./alacritty.nix
    ./hyprland.nix
    ./nixvim.nix
    ./zsh.nix
    ./lazygit.nix
    ./starship.nix
  ];
}
