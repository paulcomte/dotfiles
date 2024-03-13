{ config, pkgs, ... }:

{
  users.defaultUserShell = pkgs.fish;

  users.users.paul = {
    isNormalUser = true;
    extraGroups = [ "wheel" "video" "libvirtd" "audio" "light" ];
  };
}
