{
  config,
  lib,
  ...
}:
{
  imports = [
    ./binds.nix
  ];

  wayland.windowManager.niri = {
    enable = true;
    # systemd.enable = true;
    settings = {
      screenshot-path = "~/Screenshots/%Y-%m-%d %H-%M-%S.png";
      environment.ELECTRON_OZONE_PLATFORM_HINT = "auto";
      clipboard.disable-primary = { }; # Disable middle click paste
      gestures.hot-corners.off = { };
      hotkey-overlay.skip-at-startup = { };
      layout = {
        gaps = 8;
        always-center-single-column = true;
        border = {
          width = 1;
          active-color = "#9399b2"; # Catppuccin Mocha Overlay 2
          inactive-color = "#11111b"; # Catppuccin Mocha Crust
          urgent-color = "#74c7ec"; # Catppuccin Mocha Sapphire
        };
        focus-ring.off = { };
        shadow = {
          softness = 20;
          spread = 5;
          draw-behind-window = true;
          offset._props = {
            x = 2;
            y = 2;
          };
        };
        preset-column-widths._children = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
        ];
      };
      prefer-no-csd = { };
      input = {
        touchpad = {
          tap = { };
          natural-scroll = { };
        };
        keyboard = {
          xkb = {
            layout = "de";
            variant = "";
            options = "caps:escape";
            model = "";
            rules = "";
          };
        };
        mouse.scroll-button-lock = { };
      };

      _children = [
        {
          layer-rule = {
            match._props.namespace = "^notifications$";
            block-out-from = "screencast";
          };
        }
        {
          window-rule = {
            draw-border-with-background = false;
            clip-to-geometry = true;
            geometry-corner-radius = builtins.genList (_: 8.0) 4;
          };
        }
        {
          window-rule = {
            match._props.app-id = "^firefox$";
            open-maximized = true;
          };
        }
        {
          window-rule = {
            match._props = {
              app-id = "^firefox$";
              title = "^Picture-in-Picture$";
            };
            open-floating = true;
          };
        }
        {
          window-rule = {
            match._props.app-id = "^kitty$";
            default-column-width.proportion = 1.0 / 2.0;
            default-window-height = { };
          };
        }
      ];
      spawn-at-startup = lib.optional config.programs.noctalia.enable "noctalia";
    };
  };
}
