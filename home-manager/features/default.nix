{
  pkgs,
  config,
  ...
}: {
  imports = [
    ./mako.nix
    ./nvidia.nix
    ./hyprland.nix
    ./tmux.nix
    ./alacritty.nix
  ];
}
