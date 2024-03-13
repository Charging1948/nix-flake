{
  pkgs,
  config,
  lib,
  inputs,
  ...
}: {
  home.packages = [inputs.neovim-flake.packages.${pkgs.system}.default];
}
