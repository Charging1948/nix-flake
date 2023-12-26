{
  pkgs,
  config,
  lib,
  ...
}: {
  virtualisation.waydroid.enable = true;

  environment.systemPackages = with pkgs; [
    # Add wl-clipboard for clipboard sharing
    wl-clipboard
  ];
}
