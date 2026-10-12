{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      package = pkgs.nerd-fonts.jetbrains-mono;
    };
    enableGitIntegration = true;
    settings = {
      background_opacity = 0.85;
      shell = "nu";
      confirm_os_window_close = 0;
      # TODO: MOORE
    };
  };
}
