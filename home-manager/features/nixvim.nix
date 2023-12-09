{
  pkgs,
  config,
  lib,
  ...
}: {
  programs.nixvim = {
    enable = true;
    colorschemes.catppuccin.enable = true;
    options = {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers

      shiftwidth = 2; # Tab width should be 2
    };
    globals.mapleader = " ";
  };
}
