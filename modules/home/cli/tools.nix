{
  pkgs,
  inputs,
  config,
  ...
}:
{
  imports = [
    inputs.nix-index-database.homeModules.default
  ];

  home.packages = with pkgs; [
    code-cursor
    tokei
    igrep
    systemctl-tui
    onefetch
    bluetui
    caligula
    tenki
    tarts
    sshs
    proton-vpn
    dust
    charm-freeze
    wthrr
    dive
    inputs.ai-usagebar.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.bat.enable = true;
  programs.btop.enable = true;
  programs.fd.enable = true;
  programs.lsd.enable = true;
  programs.skim.enable = true;
  programs.ripgrep.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    flake = "${config.home.homeDirectory}/config";
  };

  programs.nix-index-database.comma.enable = true;
  services.playerctld.enable = true;
}
