{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  imports = [
    # ./desktop/common
    ./gnome.nix
    ./hardware.nix
    ./development.nix
    ./nvidia.nix
    ./razer.nix
    ./steam.nix
    ./waydroid.nix
    ./wayland-wm.nix
  ];
  environment.systemPackages = with pkgs; [
    cachix
  ];
}
