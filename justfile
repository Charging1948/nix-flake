update:
  nix flake update

update-input input="neovim-flake":
  nix flake lock --update-input "{{input}}"

rebuild system="protean":
  sudo nixos-rebuild --flake ".#{{system}}" switch
