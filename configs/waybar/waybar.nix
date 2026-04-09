{ pkgs, lib, ... }:
{

  home.file.".config/waybar" = {
    source = ./waybar;
    force = true;
  };
  programs.waybar.enable = true;
}
