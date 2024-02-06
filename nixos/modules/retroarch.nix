{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    (retroarch.override {
      cores = with libretro; [vba-next desmume citra];
    })
  ];
}
