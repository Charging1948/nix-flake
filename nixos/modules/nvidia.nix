{
  pkgs,
  config,
  lib,
  ...
}: {
  hardware.nvidia = {
    modesetting.enable = true;
    prime = {
      reverseSync.enable = lib.mkDefault true;
      allowExternalGpu = lib.mkDefault false;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  specialisation = {
    high-performance.configuration = {
      system.nixos.tags = ["high-performance"];
      hardware.nvidia.prime = {
        reverseSync.enable = lib.mkForce false;
        prime.sync.enable = lib.mkForce true;
      };
    };
  };
}