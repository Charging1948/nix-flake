{pkgs, ...}: {
  boot.kernelParams = ["button.lid_init_state=open"];
  hardware.openrazer.enable = true;
  hardware.openrazer.devicesOffOnScreensaver = false;
  hardware.openrazer.users = ["jk"];
  environment.systemPackages = with pkgs.unstable; [
    openrazer-daemon
    polychromatic
  ];
}
