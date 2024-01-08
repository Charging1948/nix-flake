{
  pkgs,
  config,
  lib,
  ...
}: {
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  environment.systemPackages = with pkgs.gnomeExtensions; [
    gsconnect
    espresso
    vim-alt-tab
    appindicator
    sound-output-device-chooser
    impatience
    clipboard-indicator
    trimmer
  ];
  services.udev.packages = with pkgs; [gnome.gnome-settings-daemon];
}
