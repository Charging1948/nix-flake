{pkgs, ...}: {
  programs.kdeconnect.enable = true;

  programs.gnupg.agent = {
    enable = true;
    enableExtraSocket = true;
    enableBrowserSocket = true;
    enableSSHSupport = true;
    pinentryFlavor = "qt";
  };

  environment.shellInit = ''
    gpg-connect-agent /bye
    export SSH_AUTH_SOCK=$(gpgconf --list-dirs agent-ssh-socket)
  '';

  # Set environment variables
  programs.fish.interactiveShellInit = ''
    set -e SSH_AGENT_PID
    set -x GPG_TTY (tty)
    set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
  '';
}
