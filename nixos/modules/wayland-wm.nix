{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      inputs.hyprland.packages.${system}.xdg-desktop-portal-hyprland
      # xdg-desktop-portal-gtk
    ];
  };

  environment.systemPackages = with pkgs; [wdisplays];

  security.pam.services.swaylock = {};
}
