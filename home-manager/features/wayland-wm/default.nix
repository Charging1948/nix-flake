{ lib, ... }:
{
  imports = [
    ./hyprland.nix
    ./hyprbars.nix
    ./swayidle.nix
    ./swaylock.nix
    ./waybar.nix
    ./wofi.nix
  ];
}
