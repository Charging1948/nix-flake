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

  security.pam.services.swaylock = {};
}
