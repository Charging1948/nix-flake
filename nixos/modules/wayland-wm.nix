{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  xdg.portal = {
    enable = true;
  };
  security.pam.services.swaylock = {};
}
