{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.hyprland = {
    enable = true;
    enableNvidiaPatches = true;
    xwayland = true;
  };
}
