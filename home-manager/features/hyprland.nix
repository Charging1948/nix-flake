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

  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  hardware = {
    opengl.enable = true;
  };
}
