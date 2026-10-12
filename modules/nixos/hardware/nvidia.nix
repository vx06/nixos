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
      modesetting.enable = true;
      prime.allowExternalGpu = true;
    };
  };

  services.displayManager.sddm.wayland.enable = lib.mkForce false;

}
