{
  pkgs,
  config,
  lib,
  ...
}: {
  services.xserver.videoDrivers = lib.mkDefault ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = lib.mkDefault true;
    open = false;
    powerManagement.enable = lib.mkDefault true;
    powerManagement.finegrained = lib.mkDefault false;
    prime = {
      offload = let mkOptional = lib.mkOverride 500; in {
        enable = mkOptional false;
        enableOffloadCmd = mkOptional false;
      };
      reverseSync.enable = lib.mkDefault true;
      sync.enable = lib.mkDefault false;
      allowExternalGpu = lib.mkDefault false;
      intelBusId = lib.mkDefault "PCI:0:2:0";
      nvidiaBusId = lib.mkDefault "PCI:1:0:0";
    };
  };

  environment.systemPackages = with pkgs; [ nvidia-offload ];

  specialisation = {

    # Enable Sync Mode for maximum performance
    high-performance.configuration = let
      mkAlmostForce = lib.mkOverride 102;
    in {
      system.nixos.tags = ["high-performance"];
      hardware.nvidia.prime = with lib; {
        reverseSync.enable = mkAlmostForce false;
        sync.enable = mkAlmostForce true;
      };
      powerManagement.cpuFreqGovernor = lib.mkForce "performance";
    };

    # Completely disable nvidia card to save battery.
    on-the-go.configuration = {
      system.nixos.tags = ["on-the-go"];

      services.xserver.videoDrivers = lib.mkForce ["i915"];
      hardware.nvidia.prime = with lib; {
        offload.enable = mkForce false;
        reverseSync.enable = mkForce false;
      };
      boot.extraModprobeConfig = ''
        blacklist nouveau
        options nouveau modeset=0
      '';
        
      services.udev.extraRules = ''
        # Remove NVIDIA USB xHCI Host Controller devices, if present
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c0330", ATTR{power/control}="auto", ATTR{remove}="1"
        # Remove NVIDIA USB Type-C UCSI devices, if present
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x0c8000", ATTR{power/control}="auto", ATTR{remove}="1"
        # Remove NVIDIA Audio devices, if present
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x040300", ATTR{power/control}="auto", ATTR{remove}="1"
        # Remove NVIDIA VGA/3D controller devices
        ACTION=="add", SUBSYSTEM=="pci", ATTR{vendor}=="0x10de", ATTR{class}=="0x03[0-9]*", ATTR{power/control}="auto", ATTR{remove}="1"
      '';
      boot.blacklistedKernelModules = [ "nouveau" "nvidia" "nvidia_drm" "nvidia_modeset" ];
    };
  };
}
