{
  writeShellApplication,
  pkgs,
}: let
  inherit (pkgs) gnupg gawk;
  echo = pkgs.coreutils;
in
  writeShellApplication {
    name = "remove-keygrips";
    runtimeInputs = [gnupg gawk echo];
    text = ''
        (( $# )) || { echo "Specify a key." >&2; exit 1; }
      KEYGRIPS=$(gpg --with-keygrip --list-secret-keys "$@" | awk '/Keygrip/ { print $3 }')
      for keygrip in $KEYGRIPS
      do
          rm "$HOME/.gnupg/private-keys-v1.d/$keygrip.key" 2> /dev/null
      done

      gpg --card-status
    '';
  }
