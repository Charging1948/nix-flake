update:
  nix flake update

rebuild system="protean":
  sudo nixos-rebuild --flake ".#{{system}}" switch
