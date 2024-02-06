{...}: {
  # https://devenv.sh/languages/
  languages.nix.enable = true;
  languages.haskell.enable = true;

  # https://devenv.sh/pre-commit-hooks/
  pre-commit.hooks.alejandra.enable = true;
  pre-commit.hooks.nil.enable = true;
  # pre-commit.hooks.deadnix.enable = true;
}
