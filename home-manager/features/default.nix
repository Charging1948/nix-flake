{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./mako.nix
    ./tmux.nix
    ./alacritty.nix
    ./nixvim.nix
    ./zsh.nix
    ./lazygit.nix
    ./starship.nix
  ];
}
