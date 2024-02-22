{
  inputs,
  pkgs,
  ...
}: {
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
      extraPkgs = pkgs:
        with pkgs; [
          gamescope
          mangohud
          gamemode
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
    extraCompatPackages = [inputs.nix-gaming.packages.${pkgs.system}.proton-ge];
  };
  programs.gamemode = {enable = true;};
  programs.gamescope = {
    enable = true;
    capSysNice = true;
    env = {
      __NV_PRIME_RENDER_OFFLOAD = "1";
      __VK_LAYER_NV_optimus = "NVIDIA_only";
      __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    };
  };

  programs.dconf.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  environment.systemPackages = with pkgs; [lutris steamtinkerlaunch];
}
