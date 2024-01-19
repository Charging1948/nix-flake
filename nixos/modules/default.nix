{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  imports = [
    # ./desktop/common
    ./podman.nix
    ./gnome.nix
    ./files.nix
    ./hardware.nix
    ./development.nix
    ./connectivity.nix
    ./nvidia.nix
    ./razer.nix
    ./steam.nix
    ./vscode.nix
    ./waydroid.nix
    ./wayland-wm.nix
    ./wine.nix
    ./yubikey.nix
  ];
  environment.systemPackages = with pkgs; [
    cachix
    ungoogled-chromium
  ];
  services.teamviewer.enable = true;
}
