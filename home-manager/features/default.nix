{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./mako.nix
    ./hyprland.nix
    ./tmux.nix
    ./alacritty.nix
  ];
}
