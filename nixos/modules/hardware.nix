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
    ];
  };

  environment.systemPackages = with pkgs.unstable;
    [keymapp wootility]
    ++ (with pkgs.nixgl; [
      auto.nixGLDefault
      auto.nixGLNvidia
      auto.nixGLNvidiaBumblebee
      nixGLIntel
      auto.nixVulkanNvidia
      nixVulkanIntel
    ]);

  users.users.jk.extraGroups = ["input"];
}
