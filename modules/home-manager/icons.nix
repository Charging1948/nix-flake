{
  pkgs,
  inputs,
  lib,
  config,
  ...
}: let
  inherit (lib) types mkOption;
in {
  options.icons = mkOption {
    type = types.path;
    default = let
      wallpaperPackage = inputs.md-icons;
    in "${wallpaperPackage}/svg";
    description = "Base path of icons file. This can be overridden by the user.";
  };
}
