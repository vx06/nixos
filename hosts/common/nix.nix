{ pkgs, ... }:
{
  nix = {
    package = pkgs.nixVersions.latest;
    settings = {
      experimental-features = [
        "flakes"
        "nix-command"
        "pipe-operators"
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
}
