{
  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  inputs.home-manager.url = "github:nix-community/home-manager";
  inputs.hyprland.url = "github:hyprwm/Hyprland";

  outputs = { self, nixpkgs, ... } @ inputs: {
    nixosConfigurations.io = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
      inputs.hyprland.nixosModules.default
      { programs.hyprland.enable = true; }
        ./nixos
        inputs.home-manager.nixosModule
        {
          home-manager.useGlobalPkgs = true;
          home-manager.users.paul.imports = [ ./home ];
        }
      ];
    };
  };
}
