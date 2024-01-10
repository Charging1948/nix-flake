{lib, config, ...}:
{
  imports = [
    ./cli
    ./kitty
    ./wayland-wm
    ./alacritty.nix
    ./lazygit.nix
    ./mako.nix
    ./nixvim.nix
    ./starship.nix
    ./tmux.nix
    ./zathura.nix
    ./zsh.nix
  ];
}
