{pkgs, ...}: {
  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
    dockerSocket.enable = true;
    defaultNetwork.settings.dns_enabled = true;
    enableNvidia = true;
  };

  environment.systemPackages = with pkgs; [podman-compose];
  environment.shellAliases = {"docker-compose" = "podman-compose";};

  # Enable to run Podman Containers as systemd services
  # virtualisation.oci-containers.backend = "podman";
  # virtualisation.oci-containers.containers = {
  #   container-name = {
  #     image = "container-image";
  #     autoStart = true;
  #     ports = [ "127.0.0.1:1234:1234" ];
  #   };
  # };
}
