{pkgs, ...}: {
  services.xserver.videoDrivers = ["displaylink"];
  environment.systemPackages = with pkgs.unstable; [displaylink];
}
