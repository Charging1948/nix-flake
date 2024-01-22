{ pkgs, lib, ... }:
{
  home.packages = with pkgs; [
    minecraft
    prismlauncher-qt5
  ];
}
