{
  inputs,
  pkgs,
  ...
}: {
  programs.steam = {
    enable = true;
    package = pkgs.steam.override {
       extraPkgs = pkgs: with pkgs; [
         gamescope
         gamemode
         mangohud
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
    extraCompatPackages = [
      inputs.nix-gaming.packages.${pkgs.system}.proton-ge
    ];
  };
  programs.gamemode.enable = true;
  hardware.opengl = {
    extraPackages = with pkgs; [mangohud];
    extraPackages32 = with pkgs; [mangohud];
  };
  environment.systemPackages = with pkgs; [
    lutris
    mangohud
  ];
}
