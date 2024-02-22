{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  programs.hyprland.enable = true;
  xdg.portal = {enable = true;};

  environment.systemPackages = with pkgs; [wdisplays];

  security.pam.services.swaylock = {};
}
