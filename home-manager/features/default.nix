{lib, config, ...}:
{
  imports = [
    ./cli
    ./kitty
    ./wayland-wm
    ./alacritty.nix
    ./lazygit.nix
    ./kdeconnect.nix
    ./mako.nix
    ./mangohud.nix
    ./nvim.nix
    ./starship.nix
    ./tmux.nix
    ./zathura.nix
    ./zsh.nix
  ];
}
