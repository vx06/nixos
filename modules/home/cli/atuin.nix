{ ... }:
{
  programs.atuin = {
    enable = true;
    forceOverwriteSettings = true;
    daemon.enable = true;
    settings = {
      invert = true;
      filter_mode_shell_up_key_binding = "session";
      style = "auto";
      update_check = false;
      enter_accept = true;
    };
  };
}
