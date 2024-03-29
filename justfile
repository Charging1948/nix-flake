update:
  nix flake update

update-input input="neovim-flake":
  nix flake lock --update-input "{{input}}"

update-nvim:
  nix flake lock --update-input "neovim-flake"
  git add flake.lock
  git commit -m "neovim: update to latest version"

rebuild system="protean":
  sudo nixos-rebuild --flake ".#{{system}}" switch
