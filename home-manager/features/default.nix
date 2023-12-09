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
  ];
}
