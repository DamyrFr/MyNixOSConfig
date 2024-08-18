{
  description = "Damyr Nix config";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager = {
    	url = "github:nix-community/home-manager/release-23.11";
    	inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
  	nixosConfigurations = {
  		"lorraine" = nixpkgs.lib.nixosSystem {
  			system = "x86_64-linux";
  			modules = [
				./hosts/lorraine
				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;
					home-manager.users.damyr = import ./home/damyr;
				}
  			];
  		};
  	};
  };
}
