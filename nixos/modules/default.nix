{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  imports = [
    ./gnome.nix
    ./jetbrains.nix
    ./nvidia.nix
    ./razer.nix
    ./steam.nix
    ./waydroid.nix
    ./wayland-wm.nix
  ];
}
