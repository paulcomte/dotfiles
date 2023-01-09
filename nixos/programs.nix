{ config, pkgs, ... }:

{
  programs.dconf.enable = true;
  programs.ssh.ciphers = [ "aes256-gcm@openssh.com" ];
  programs.fish.enable = true;
  programs.sway.enable = true;
}
