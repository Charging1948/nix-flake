{lib, config, ...}:
{
  imports = [
    ./desktop/common
    ./kitty
    ./alacritty.nix
    ./lazygit.nix
    ./mako.nix
    ./nixvim.nix
    ./starship.nix
    ./tmux.nix
    ./wayland-wm
    ./zathura.nix
    ./zsh.nix
  ];
}
