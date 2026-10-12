{ config, ... }:
{
  programs.git = {
    enable = true;
    lfs.enable = true;
    settings = {
      user.name = "vx06";
      # TODO: real email with secret management
      user.email = "yourmom@nixos.org";
      init.defaultBranch = "main";
    };
    signing = {
      signByDefault = true;
      format = "ssh";
      key = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
  };

  programs.gitui.enable = true;
}
