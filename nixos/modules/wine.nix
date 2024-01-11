{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    wineWowPackages.stable
    wineWowPackages.waylandFull
    winetricks
    bottles
  ];
}
