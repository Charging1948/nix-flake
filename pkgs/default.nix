# Custom packages, that can be defined similarly to ones from nixpkgs
# You can build them using 'nix build .#example'

{ pkgs ? import <nixpkgs> { } }: rec {

  # example = pkgs.callPackage ./example { };
  tly = pkgs.callPackage ./tly { };
  hyprslurp = pkgs.callPackage ./hyprslurp { };
  nvidia-offload = pkgs.callPackage ./nvidia-offload { };
  remove-keygrips = pkgs.callPackage ./remove-keygrips { };
}
