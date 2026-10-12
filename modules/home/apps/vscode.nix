{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      jnoortheen.nix-ide
      svelte.svelte-vscode
      esbenp.prettier-vscode
      usernamehw.errorlens
      aaron-bond.better-comments
    ];
    profiles.default.userSettings = {
      "editor.tabCompletion" = "on";
      "editor.tabSize" = 2;
      "editor.fontFamily" = "'JetBrainsMono Nerd Font', monospace";
      "editor.defaultFormatter" = "esbenp.prettier-vscode";
      "editor.formatOnSave" = true;
      "workbench.browser.openLocalhostLinks" = false;
      "[nix]" = {
        "editor.tabSize" = 2;
      };
    };
  };
}
