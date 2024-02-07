{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [xdg-desktop-portal-gtk];
  };
  security.pam.services.swaylock = {};
}
