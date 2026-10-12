{
  pkgs,
  lib,
  config,
  ...
}:
let
  brightnessctl = lib.getExe pkgs.brightnessctl;
  noctaliaMsg = [
    "noctalia"
    "msg"
  ];
in
{
  wayland.windowManager.niri.settings.binds =
    lib.optionalAttrs (config.programs.noctalia.enable or false) {
      "Mod+Ctrl+Shift+Alt+L".spawn = noctaliaMsg ++ [
        "session"
        "lock"
      ];
      "Mod+Space".spawn = noctaliaMsg ++ [
        "panel-toggle"
        "launcher"
      ];
    }
    // {
      "Mod+T" = {
        _props.repeat = false;
        spawn = [ "kitty" ];
      };
      "Mod+B".spawn = [ "firefox" ];
      "Mod+Q".close-window = { };
      "Mod+C".center-column = { };
      "Mod+Ctrl+C".center-visible-columns = { };

      "Mod+R".switch-preset-column-width = { };
      "Mod+Shift+R".switch-preset-window-height = { };
      "Mod+Ctrl+R".reset-window-height = { };

      "Mod+O".toggle-overview = { };
      "Mod+M".quit = { };
      "Mod+Ctrl+Shift+M".quit._props.skip-confirmation = true;

      "Mod+S".screenshot._props.show-pointer = false;
      "Mod+Alt+S".screenshot-screen._props.show-pointer = false;
      "Mod+Shift+S".screenshot-window = { };

      "Mod+H".focus-column-left = { };
      "Mod+J".focus-window-or-workspace-down = { };
      "Mod+K".focus-window-or-workspace-up = { };
      "Mod+L".focus-column-right = { };

      "Mod+Shift+H".move-column-left = { };
      "Mod+Shift+J".move-window-down-or-to-workspace-down = { };
      "Mod+Shift+K".move-window-up-or-to-workspace-up = { };
      "Mod+Shift+L".move-column-right = { };

      "Mod+Minus".set-column-width = "-10%";
      "Mod+Plus".set-column-width = "+10%";
      "Mod+Ctrl+Minus".set-window-height = "-10%";
      "Mod+Ctrl+Plus".set-window-height = "+10%";

      "Mod+F".maximize-column = { };
      "Mod+Shift+F".fullscreen-window = { };
      "Mod+Ctrl+F".expand-column-to-available-width = { };

      "Mod+V".toggle-window-floating = { };
      "Mod+Shift+V".switch-focus-between-floating-and-tiling = { };

      XF86AudioMute = {
        _props.allow-when-locked = true;
        spawn = [
          "wpctl"
          "set-mute"
          "@DEFAULT_AUDIO_SINK@"
          "toggle"
        ];
      };
      XF86AudioMicMute = {
        _props.allow-when-locked = true;
        spawn = [
          "wpctl"
          "set-mute"
          "@DEFAULT_AUDIO_SOURCE@"
          "toggle"
        ];
      };
      XF86AudioRaiseVolume = {
        _props.allow-when-locked = true;
        spawn = [
          "wpctl"
          "set-volume"
          "-l"
          "1.0"
          "@DEFAULT_AUDIO_SINK@"
          "5%+"
        ];
      };
      XF86AudioLowerVolume = {
        _props.allow-when-locked = true;
        spawn = [
          "wpctl"
          "set-volume"
          "@DEFAULT_AUDIO_SINK@"
          "5%-"
        ];
      };
      XF86MonBrightnessUp = {
        _props.allow-when-locked = true;
        spawn = [
          brightnessctl
          "set"
          "5%+"
        ];
      };
      XF86MonBrightnessDown = {
        _props.allow-when-locked = true;
        spawn = [
          brightnessctl
          "set"
          "5%-"
        ];
      };
      XF86AudioPlay = {
        _props.allow-when-locked = true;
        spawn = [
          "playerctl"
          "play-pause"
        ];
      };
      XF86AudioPrev = {
        _props.allow-when-locked = true;
        spawn = [
          "playerctl"
          "previous"
        ];
      };
      XF86AudioNext = {
        _props.allow-when-locked = true;
        spawn = [
          "playerctl"
          "next"
        ];
      };
    }
    // (
      builtins.listToAttrs
      <| lib.mapCartesianProduct (
        { key, cmd }:
        let
          direction =
            {
              H = "left";
              J = "down";
              K = "up";
              L = "right";
            }
            .${key};
          combination =
            {
              focus-monitor = "Ctrl";
              move-column-to-monitor = "Shift+Alt";
              move-workspace-to-monitor = "Shift+Ctrl";
            }
            .${cmd};
        in
        lib.nameValuePair "Mod+${combination}+${key}" { "${cmd}-${direction}" = { }; }
      )
      <| {
        key = [
          "H"
          "J"
          "K"
          "L"
        ];
        cmd = [
          "focus-monitor"
          "move-column-to-monitor"
          "move-workspace-to-monitor"
        ];
      }
    )
    // (
      9
      |> builtins.genList (
        i:
        let
          wp = i + 1;
        in
        [
          (lib.nameValuePair "Mod+${toString wp}" { focus-workspace = wp; })
          (lib.nameValuePair "Mod+Ctrl+${toString wp}" { move-column-to-workspace = wp; })
        ]
      )
      |> lib.flatten
      |> builtins.listToAttrs
    );
}
