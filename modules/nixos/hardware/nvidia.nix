{ config, lib, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
    };
    nvidia = {
      open = true;
      nvidiaPersistenced = true;
      powerManagement.enable = true;
      prime.allowExternalGpu = true;
    };
    nvidia-container-toolkit.enable = true;
  };
}
