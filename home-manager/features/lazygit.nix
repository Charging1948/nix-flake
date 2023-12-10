{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.lazygit = {
    enable = true;
  };
}
