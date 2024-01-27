{ inputs, pkgs, ... }: {
  programs.steam = {
    enable = true;
    # package = pkgs.steam.override {
    #   extraLibraries = (pkgs: [
    #     pkgs.openssl
    #     pkgs.dconf
    #     pkgs.gvfs
    #     pkgs.nghttp2
    #     pkgs.libidn2
    #     pkgs.rtmpdump
    #     pkgs.libpsl
    #     pkgs.curl
    #     pkgs.krb5
    #     pkgs.keyutils
    #   ]);
    #   extraPkgs = pkgs:
    #     with pkgs; [
    #       gamescope
    #       gamemode
    #       mangohud
    #       xorg.libXcursor
    #       xorg.libXi
    #       xorg.libXinerama
    #       xorg.libXScrnSaver
    #       libpng
    #       libpulseaudio
    #       libvorbis
    #       stdenv.cc.cc.lib
    #       libkrb5
    #       keyutils
    #     ];
    # };
    gamescopeSession.enable = true;
    extraCompatPackages =
      [ inputs.nix-gaming.packages.${pkgs.system}.proton-ge ];
  };
  programs.gamemode = { enable = true; };
  programs.gamescope = {
    enable = true;
    package = pkgs.gamescope;
    capSysNice = true;
  };

  programs.dconf.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    extraPackages = with pkgs; [ mangohud ];
    extraPackages32 = with pkgs; [ mangohud ];
  };
  environment.systemPackages = with pkgs; [ lutris steamtinkerlaunch ];
}
