{pkgs, ...}: {
  services.cpupower-gui.enable = true;
  # hardware.fancontrol.enable = true;

  services.hardware.bolt.enable = true;
  hardware.wooting.enable = true;
  hardware.keyboard.zsa.enable = true;

  services.geoclue2.enable = true;

  environment.systemPackages = with pkgs.unstable; [keymapp wootility];

  users.users.jk.extraGroups = ["input"];
}
