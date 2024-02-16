{pkgs, ...}: {
  imports = [
    # ./desktop/common
    ./boot.nix
    ./displaylink.nix
    ./podman.nix
    ./retroarch.nix
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
    ./x11-wm.nix
    ./wine.nix
    ./yubikey.nix
  ];
  environment.systemPackages = with pkgs; [cachix ungoogled-chromium];
  services.teamviewer.enable = true;
}
