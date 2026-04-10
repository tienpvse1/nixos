{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager = {
    	url = "github:nix-community/home-manager/release-25.11";
	inputs.nixpkgs.follows = "nixpkgs";
    };
    antigravity-nix = {
      url = "github:jacopone/antigravity-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    awsvpnclient-nix = {
	url = "github:AddG0/awsvpnclient-nix";
	inputs.nixpkgs.follows = "nixpkgs";
     };
  };

  outputs = { self, nixpkgs, home-manager, antigravity-nix, awsvpnclient-nix,... }@inputs: 
  	let
		lib = nixpkgs.lib;
		system = "x86_64-linux";
		pkgs = import nixpkgs { inherit system;};
	in
	{
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	    	      inherit system;
		      specialArgs = { inherit inputs; };
		      modules = [
			 awsvpnclient-nix.nixosModules.default
			 {
			programs.awsvpnclient.enable = true;
		      }
			./configuration.nix  
		      ];
		    };
		homeConfigurations = {
			tienpvse = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = { inherit inputs; };
				modules = [ 
					./home.nix 
				];
			};
		};
	};

  
}
