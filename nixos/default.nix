# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{

  nix = {
    package = pkgs.nixFlakes; # or versioned attributes like nixVersions.nix_2_8
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
   };

  imports =
    [
      # Include the results of the hardware scan.
      ./hardware-configuration.nix
      
      ./boot.nix
      ./packages.nix
      ./programs.nix
      ./services.nix
      ./networking.nix
      ./configuration.nix
      ./users.nix
      #./nvidia.nix
    ];

  nixpkgs.config = {
    allowUnfree = true;
  };
  
#  vscode.user = "paul";
#  vscode.homeDir = "/home/paul";
#  vscode.extensions = with pkgs.vscode-extensions; [
#    ms-vscode.cpptools
#  ];
  
#  nixpkgs.latestPackages = [
#    "vscode"
#    "vscode-extensions"
#  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "22.11"; # Did you read the comment?

}

