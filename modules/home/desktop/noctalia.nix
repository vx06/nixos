{ inputs, ... }:
{
  programs.noctalia = {
    enable = true;
    systemd.enable = true;
    settings = {
      theme = {
        builtin = "Catppuccin";
        source = "community";
        community_palette = "Catppuccin Lavender"; # = mocha
      };
      bar = {
        default = {
          capsule_group = [
            {
              fill = "surface_variant";
              id = "g1";
              members = [
                "cpu"
                "ram"
                "temp"
              ];
              opacity = 1;
              padding = 6;
            }
          ];
          center = [ "workspaces" ];
          end = [
            "felipeartur/ai-usagebar:bar"
            "clipboard"
            "andrewdems/vpn-manager:bar"
            "network"
            "bluetooth"
            "volume"
            "brightness"
            "battery"
            "notifications"
            "control-center"
            "session"
          ];
          position = "top";
          margin_edge = 10;
          margin_ends = 5;
          padding = 16;
          capsule = true;
          start = [
            "wallpaper"
            "group:g1"
            "clock"
            "thepunkoff/pomodoro:widget"
            "media"
          ];
        };
      };
      shell = {
        offline_mode = false;
        launch_apps_as_systemd_service = true;
        font-family = "JetBrainsMono NF";
        animation = {
          enabled = true;
          speed = 1.5;
        };
        panel = {
          transparency_mode = "glass";
          launcher_placement = "centered";
          open_near_click_control_center = true;
          open_near_click_launcher = true;
        };
      };
      idle = {
        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 300;
          };
          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = true;
            timeout = 600;
          };
          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 450;
          };
        };
        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];
      };
      wallpaper = {
        enabled = true;
        default.path = "${inputs.self}/assets/wallpapers/ruins.jpg";
        directory = builtins.path { path = inputs.self + /assets/wallpapers; };
      };
      plugins = {
        enabled = [
          "thepunkoff/pomodoro"
          "andrewdems/vpn-manager"
          "felipeartur/ai-usagebar"
        ];
        source = [
          {
            name = "official";
            kind = "git";
            location = "https://github.com/noctalia-dev/official-plugins";
            enabled = true;
          }
          {
            name = "community";
            kind = "git";
            location = "https://github.com/noctalia-dev/community-plugins";
            enabled = true;
          }
        ];
      };
      plugin_settings = {
        "thepunkoff/pomodoro" = {
          work-duration = 50;
          short-break-duration = 10;
          long-break-duration = 30;
          sessions-before-long-break = 3;
        };
      };
      location = {
        auto_locate = true;
      };
      weather = {
        enabled = true;
        refresh_minutes = 15;
        unit = "metric";
        effects = true;
      };
    };
  };
}
