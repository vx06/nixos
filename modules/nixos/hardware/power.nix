{ ... }:
{
  services.upower.enable = true;
  services.power-profiles-daemon.enable = true;

  # Optional auto-cpufreq configuration (conflicts with power-profiles-daemon if enabled)
  # services.auto-cpufreq = {
  #   enable = true;
  #   settings = {
  #     battery = {
  #       governor = "powersave";
  #       turbo = "never";
  #     };
  #     charger = {
  #       governor = "performance";
  #       turbo = "auto";
  #     };
  #   };
  # };
}
