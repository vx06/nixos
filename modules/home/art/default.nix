{ pkgs, ... }:
{
  home.packages = with pkgs; [
    orca-slicer  
    blender 
    shotcut
  ];
}