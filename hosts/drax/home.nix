_:
{
  # niri monitor config overwrite
  wayland.windowManager.niri = {
    settings = {
      _children = [
        { 
          output = { 
            _args = ["DP-1"];
            mode = "1920x1080@165";
            scale = 1;
            position._props = {
              x = 1080;
              y = 420;
            }; 
          }; 
        }
        { 
          output = { 
            _args = ["HDMI-A-1"];
            mode = "1920x1080@60";
            scale = 1; 
            transform = "90"; 
            position._props = {
              x = 0;
              y = 0;
            };
          }; 
        }
      ];
    };
  };

  programs.noctalia.settings.bar.default.monitor = {
    dp1 = {
      match = "DP-1";
      enabled = true;
    };
    hdmi-a-1 = {
      match = "HDMI-A-1";
      enabled = false;
    };
  };
}