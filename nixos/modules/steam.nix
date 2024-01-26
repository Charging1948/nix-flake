{ inputs, pkgs, ... }: {
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs:
        with pkgs; [
          unstable.gamescope
          unstable.gamemode
          unstable.mangohud
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          libkrb5
          keyutils
        ];
    };
    gamescopeSession.enable = true;
    extraCompatPackages =
      [ inputs.nix-gaming.packages.${pkgs.system}.proton-ge ];
  };
  programs.gamemode = { enable = true; };
  programs.gamescope = {
    enable = true;
    package = pkgs.unstable.gamescope;
    capSysNice = true;
  };
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs.unstable; [ mangohud ];
    extraPackages32 = with pkgs.unstable; [ mangohud ];
  };
  environment.systemPackages = with pkgs; [
    lutris
    unstable.mangohud
    unstable.gamescope
  ];
}
