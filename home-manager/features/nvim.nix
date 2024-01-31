{ pkgs, config, lib, inputs, ... }: {

  home.packages = [ inputs.neovim-flake.packages.${pkgs.system}.default ];
  # programs.nixvim = {
  #   enable = true;
  #   plugins = {
  #     alpha = {
  #       enable = true;
  #     };
  #     auto-session = {
  #       enable = true;
  #     };
  #     barbar = {
  #       enable = true;
  #     };
  #     better-escape = {
  #       enable = true;
  #     };
  #     comment-nvim = {
  #       enable = true;
  #     };
  #     dap = {
  #       enable = true;
  #     };
  #     nix = {
  #       enable = true;
  #     };
  #     none-ls = {
  #       enable = true;
  #     };
  #     nvim-autopairs = {
  #       enable = true;
  #     };
  #     lualine = {
  #       enable = true;
  #     };
  #     lsp = {
  #       enable = true;
  #     };
  #     leap = {
  #       enable = true;
  #     };
  #     harpoon = {
  #       enable = true;
  #     };
  #     emmet = {
  #       enable = true;
  #     };
  #     neo-tree = {
  #       enable = true;
  #     };
  #     neorg = {
  #       enable = true;
  #     };
  #     nvim-cmp = {
  #       enable = true;
  #     };
  #     oil = {
  #       enable = true;
  #     };
  #     lint = {
  #       enable = true;
  #     };
  #     lsp-format = {
  #       enable = true;
  #     };
  #     lspsaga = {
  #       enable = true;
  #     };
  #     lspkind = {
  #       enable = true;
  #       cmp.enable = true;
  #     };
  #     plantuml-syntax = {
  #       enable = true;
  #     };
  #     presence-nvim = {
  #       enable = true;
  #     };
  #     project-nvim = {
  #       enable = true;
  #     };
  #     refactoring = {
  #       enable = true;
  #     };
  #     surround = {
  #       enable = true;
  #     };
  #     telescope = {
  #       enable = true;
  #       extensions = {
  #         file_browser.enable = true;
  #         frecency.enable = true;
  #         fzf-native.enable = true;
  #         project-nvim.enable = true;
  #         undo.enable = true;
  #       };
  #     };
  #     tmux-navigator = {
  #       enable = true;
  #     };
  #     todo-comments = {
  #       enable = true;
  #     };
  #     treesitter = {
  #       enable = true;
  #     };
  #     treesitter-context = {
  #       enable = true;
  #     };
  #     treesitter-refactor = {
  #       enable = true;
  #     };
  #     treesitter-textobjects = {
  #       enable = true;
  #     };
  #     typst-vim = {
  #       enable = true;
  #     };
  #     undotree = {
  #       enable = true;
  #     };
  #     vimtex = {
  #       enable = true;
  #     };
  #     which-key = {
  #       enable = true;
  #     };
  #   };
  #   colorschemes.catppuccin.enable = true;
  #   options = {
  #     number = true; # Show line numbers
  #     relativenumber = true; # Show relative line numbers
  #
  #     shiftwidth = 2; # Tab width should be 2
  #   };
  #   globals.mapleader = " ";
  # };
}
