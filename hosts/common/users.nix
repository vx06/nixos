{ config, lib, ... }:
{
  sops.secrets."vx/password_hash".neededForUsers = true;

  # Define user account.
  users.users.vx = {
    isNormalUser = true;
    description = "vx";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    hashedPasswordFile = config.sops.secrets."vx/password_hash".path;
    openssh.authorizedKeys.keyFiles = lib.fileset.toList ./pubkeys;
  };
}
