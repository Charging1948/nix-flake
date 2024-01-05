{ environment, pkgs, lib, ... }:
let jetbrains-idea-config = {
  programs = [
    "clion"
    "webstorm"
    "rust-rover"
    "pycharm-professional"
    "rider"
    "idea-ultimate"
    "goland"
  ];
  extensions = [
    "ideavim"
    "github-copilot"
    "nixidea"
  ];
};
in 
  {
    environment.systemPackages = map (pkgName: lib.attrByPath [ pkgName ] null pkgs.jetbrains // pkgs.jetbrains.plugins.addPlugins pkgs.jetbrains.${pkgName} jetbrains-idea-config.extensions) jetbrains-idea-config.programs;
  }
