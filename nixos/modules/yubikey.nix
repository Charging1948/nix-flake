{ pkgs, ... }:
{
  services.udev.packages = with pkgs; [ 
    yubikey-agent
    age-plugin-yubikey
    yubikey-personalization
    yubikey-personalization-gui
    yubikey-touch-detector
    yubikey-manager
    yubikey-manager-qt
  ];

  environment.systemPackages = with pkgs; [
    yubikey-agent
    age-plugin-yubikey
    yubikey-personalization
    yubikey-personalization-gui
    yubikey-touch-detector
    yubikey-manager
    yubikey-manager-qt
  ];

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  services.yubikey-agent.enable = true;
  programs.yubikey-touch-detector.enable = true;

  security.pam.services = {
    login.u2fAuth = true;
    sudo.u2fAuth = true;
  };

  # Lock screen when unplugging yubikey
  services.udev.extraRules = ''
      ACTION=="remove",\
       ENV{ID_BUS}=="usb",\
       ENV{ID_MODEL_ID}=="0407",\
       ENV{ID_VENDOR_ID}=="1050",\
       ENV{ID_VENDOR}=="Yubico",\
       RUN+="${pkgs.systemd}/bin/loginctl lock-sessions"
  '';
}
