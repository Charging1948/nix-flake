{ inputs, pkgs, ... }:
{
  home.packages = [
    inputs.devenv.packages.${pkgs.system}.devenv
  ];
}
