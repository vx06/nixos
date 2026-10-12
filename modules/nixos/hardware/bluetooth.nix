{ ... }:
{
  hardware.bluetooth = {
    enable = true;
    settings.General = {
      Experimental = true;
      FastConnectable = true;
      Privacy = "network/on";
      SecureConnection = "only";
    };
  };

  services.blueman.enable = true;
}
