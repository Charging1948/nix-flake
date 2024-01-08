{
  inputs,
  pkgs,
  ...
}: {
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = [
      inputs.nix-gaming.packages.${pkgs.system}.proton-ge
    ];
  };
  programs.gamemode.enable = true;
}
