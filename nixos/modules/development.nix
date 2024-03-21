{
  environment,
  pkgs,
  lib,
  ...
}: let
  jetbrains-idea-config = {
    programs = [
      "clion"
      "webstorm"
      "rust-rover"
      "pycharm-professional"
      "rider"
      "idea-ultimate"
      "goland"
      "datagrip"
    ];
    extensions = ["ideavim" "github-copilot"];
  };
in {
  environment.systemPackages = let
    inherit (pkgs.unstable) jetbrains;
  in
    with pkgs;
      [gnumake insomnia unstable.ollama]
      ++ map
      (pkgName:
        lib.attrByPath [pkgName] null jetbrains
        // jetbrains.plugins.addPlugins jetbrains.${pkgName}
        jetbrains-idea-config.extensions)
      jetbrains-idea-config.programs;
}
