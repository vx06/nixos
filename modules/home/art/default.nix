{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # TODO: flake or own pkg for elegoo slicer
    # https://github.com/NixOS/nixpkgs/issues/513195
    #(orca-slicer.override {
    #  withNvidiaGLWorkaround = true;
    #  glew = glew.override {
    #    enableEGL = false;
    #  };
    #})
    blender
    shotcut
  ];
}
