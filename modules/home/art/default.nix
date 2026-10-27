{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # NVIDIA on Wayland leaves the setup wizard and preview blank until a
    # redraw. Route GL through Zink, and build GLEW without EGL
    # https://github.com/NixOS/nixpkgs/issues/513195
    (orca-slicer.override {
      withNvidiaGLWorkaround = true;
      glew = glew.override {
        enableEGL = false;
      };
    })
    blender
    shotcut
  ];
}
