{ config, pkgs, ... }:

{
  networking.hostId = "69e67467";
  networking.hostName = "io";

  networking.networkmanager.enable = true;

  networking.nameservers = [ "1.1.1.1" "1.0.0.1" ];

  networking.firewall = {
    enable = true;

    allowedTCPPorts = [ 5900 22 ];
  };
  
}
