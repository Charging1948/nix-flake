{ pkgs, lib, ... }:
{
  home.packages = [
    pkgs.unstable.lunarvim
  ];
}
