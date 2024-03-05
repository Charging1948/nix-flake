{
  pkgs,
  inputs,
  ...
}: {
  services.cpupower-gui.enable = true;
  # hardware.fancontrol.enable = true;

  services.hardware.bolt.enable = true;
  hardware.wooting.enable = true;
  hardware.keyboard.zsa.enable = true;

  services.geoclue2.enable = true;

  hardware.opengl = {
    extraPackages = with pkgs; [
      intel-media-driver
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      mesa.drivers
      intel-compute-runtime
    ];
  };

  environment.systemPackages = with pkgs.unstable; [keymapp wootility];

  users.users.jk.extraGroups = ["input"];
}
