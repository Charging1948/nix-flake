{
  pkgs,
  lib,
  inputs,
  ...
}: {
  environment.systemPackages = with pkgs; [
    # inputs.nix-gaming.packages.${pkgs.system}.wine-ge
    winetricks
    bottles
  ];
}
