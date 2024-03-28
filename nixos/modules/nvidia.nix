{
  pkgs,
  lib,
  inputs,
  ...
}: {
  boot.kernelParams = ["nvidia_drm.modeset=1"];
  hardware.nvidia = {
    modesetting.enable = lib.mkDefault true;
    open = lib.mkForce false;
    powerManagement.enable = lib.mkDefault true;
    powerManagement.finegrained = lib.mkDefault false;
    prime = {
      offload = let
        mkOptional = lib.mkOverride 500;
      in {
        enable = mkOptional false;
        enableOffloadCmd = mkOptional false;
      };
      sync.enable = lib.mkDefault true;
      allowExternalGpu = lib.mkDefault true;
      intelBusId = lib.mkDefault "PCI:0:2:0";
      nvidiaBusId = lib.mkDefault "PCI:1:0:0";
    };
  };
  services.thermald.enable = lib.mkDefault true;

  environment.systemPackages = with pkgs; [
    nvidia-offload
    nvtop
    glxinfo
    vulkan-tools
    glmark2
  ];

  hardware.opengl = {
    extraPackages = with pkgs; [intel-media-driver];
    extraPackages32 = with pkgs.pkgsi686Linux; [intel-media-driver];
  };

  services.xserver.displayManager.gdm = {wayland = true;};

  specialisation = {
    # Enable Sync Mode for maximum performance
    high-performance.configuration = let
      mkAlmostForce = lib.mkOverride 102;
    in {
      system.nixos.tags = ["high-performance"];

      # boot.kernelPackages = mkAlmostForce pkgs.linuxPackages_xanmod;
      hardware.nvidia.prime = {
        offload.enable = mkAlmostForce false;
        offload.enableOffloadCmd = mkAlmostForce false;
        reverseSync.enable = mkAlmostForce false;
        sync.enable = mkAlmostForce true;
      };
      services.thermald.enable = mkAlmostForce false;
      powerManagement.cpuFreqGovernor = lib.mkForce "performance";
    };

    # Completely disable nvidia card to save battery.
    on-the-go.configuration = {
      system.nixos.tags = ["on-the-go"];
      imports = with inputs.nixos-hardware.nixosModules; [common-gpu-nvidia-disable];
      hardware.nvidia.prime = with lib; {
        offload.enable = mkForce false;
        offload.enableOffloadCmd = mkForce false;
        sync.enable = mkForce false;
      };
    };
  };
}
