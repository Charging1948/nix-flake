{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  xdg.portal = {enable = true;};

  environment.systemPackages = with pkgs; [wdisplays];

  security.pam.services.swaylock = {};
}
