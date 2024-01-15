{ pkgs, inputs, ... }:
let
  extensions = inputs.nix-vscode-extensions.extensions.${pkgs.system};
in {
  environment.systemPackages = with pkgs; [
    (vscode-with-extensions.override {
      vscode = vscodium;
      vscodeExtensions = with extensions; [
        open-vsx.asvetliakov.vscode-neovim
        open-vsx.wakatime.vscode-wakatime
        open-vsx.ms-python.python
        open-vsx.ms-toolsai.jupyter
        open-vsx.ms-toolsai.jupyter-renderers
        open-vsx.ms-toolsai.jupyter-keymap
        open-vsx.ms-toolsai.vscode-jupyter-cell-tags
        open-vsx.ms-toolsai.vscode-jupyter-slideshow
        open-vsx.catppuccin.catppuccin-vsc
        open-vsx.astro-build.astro-vscode
        open-vsx.graphql.vscode-graphql
        open-vsx.quarto.quarto
        open-vsx.rust-lang.rust-analyzer
        open-vsx.jnoortheen.nix-ide
        open-vsx.mkhl.direnv
        vscode-marketplace.github.copilot
        vscode-marketplace.github.copilot-chat
        vscode-marketplace.ms-vscode-remote.remote-containers
        # vscode-marketplace.
        # open-vsx.
      ];
    })
  ];
}
