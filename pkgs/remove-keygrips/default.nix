{ writeShellApplication, gnupg, awk, echo }:
writeShellApplication {
  name = "remove-keygrips";
  runtimeInputs = [ gnupg awk echo ];
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
