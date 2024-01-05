{
  lib,
  config,
  ...
}: {
  imports = [
    ./kitty
    ./alacritty.nix
    ./default.nix
    ./hyprland.nix
    ./hyprbars.nix
    ./lazygit.nix
    ./mako.nix
    ./nixvim.nix
    ./starship.nix
    ./swayidle.nix
    ./swaylock.nix
    ./tmux.nix
    ./waybar.nix
    ./wofi.nix
    ./zathura.nix
    ./zsh.nix
  ];
}
