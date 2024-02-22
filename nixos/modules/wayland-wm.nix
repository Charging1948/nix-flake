{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  services.seatd.enable = true;
  programs.hyprland.enable = true;
  xdg.portal = {enable = true;};

  environment.systemPackages = with pkgs; [wdisplays];

  security.pam.services.swaylock = {};
}
