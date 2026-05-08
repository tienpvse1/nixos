{
  description = "A very basic flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    playwright.url = "github:pietdevries94/playwright-web-flake/1.56.1";
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
    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs = {
        nixpkgs.follows = "nixpkgs";
        home-manager.follows = "home-manager";
      };
    };
    hyprland = {
      url = "github:hyprwm/Hyprland/v0.54.3-b"; 
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, antigravity-nix, playwright, awsvpnclient-nix,... }@inputs: 
  	let
		lib = nixpkgs.lib;
		system = "x86_64-linux";
     overlay = final: prev: {
       inherit (playwright.packages.${system}) playwright-test playwright-driver;
     };
		pkgs = import nixpkgs { 
      inherit system;
      overlays = [ overlay ];
      config = {
        allowUnfree = true;
      };
    };
	in
	{
    devShells.${system} = {
      default = pkgs.mkShell {
        packages = [
          pkgs.playwright-test
        ];
        shellHook = ''
          export PLAYWRIGHT_SKIP_BROWSER_DOWNLOAD=1
          export PLAYWRIGHT_BROWSERS_PATH="${pkgs.playwright-driver.browsers}"
          if [[ -t 0 ]]; then
            exec zsh
          fi
        '';
      };
    };
		nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
	    inherit system;
		  specialArgs = { inherit inputs; };
		  modules = [
			  awsvpnclient-nix.nixosModules.default
			  { programs.awsvpnclient.enable = true; }
			  ./configuration.nix  
		  ];
		};
		homeConfigurations = {
			tienpvse = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				extraSpecialArgs = { inherit inputs; };
				modules = [ 
					./home.nix 
          {
            nixpkgs.config.allowUnfree = true;
          }
				];
			};
		};
	};

  
}
