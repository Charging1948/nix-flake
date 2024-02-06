{ pkgs, ... }: {
  services.cpupower-gui.enable = true;
  hardware.fancontrol.enable = true;

  services.hardware.bolt.enable = true;
  hardware.wooting.enable = true;
  hardware.keyboard.zsa.enable = true;

  environment.systemPackages = with pkgs.unstable; [ keymapp wootility ];
}
