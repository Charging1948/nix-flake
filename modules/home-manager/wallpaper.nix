{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: let
  inherit (lib) types mkOption mkEnableOption;
in {
  options.wallpaper = {
    preset = mkOption {
      type = types.str;
      default = "catppuccin-mocha-rainbow";
      description = "Preset for the wallpaper.";
    };

    path = mkOption {
      type = types.path;
      default = let
        wallpaperPackage = inputs.nix-wallpaper.packages.${pkgs.system}.default.override {
          inherit (config.wallpaper) preset;
        };
      in "${wallpaperPackage}/share/wallpapers/nixos-wallpaper.png";
      description = "Full path to the wallpaper file. This can be overridden by the user.";
    };
  };
}
