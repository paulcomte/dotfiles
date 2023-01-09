{ pkgs, config, ... }:

{
  home.packages = with pkgs; [
    swaybg # wallpaper
    swaylock-effects # lock utility
    waybar # bar system
    wl-clipboard #clipboard support for helix on wayland
    slurp # area selection tool
    grim # screenshot util
    wofi # Win + R utility
    alacritty # terminal
  ];
}
