{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  xdg.portal = {
    extraPortals = [ inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland ];
    configPackages = [ inputs.hyprland.packages.${pkgs.system}.hyprland ];
  };
}
