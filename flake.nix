{
  description = "My System Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    mynvim.url = "github:viitorags/nvim";

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
    };

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.quickshell.follows = "quickshell";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      nixpkgs-unstable,
      mynvim,
      quickshell,
      noctalia,
      spicetify-nix,
      ...
    }@inputs:
    let
      system = "x86_64-linux";

      unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };

    in
    {
      nixosConfigurations.gh0stk = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./nixos/configuration.nix
        ];
        specialArgs = {
          inherit unstable;
          inherit inputs;
        };
      };

      homeConfigurations.vitor = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        modules = [
          ./home/home.nix
          spicetify-nix.homeManagerModules.default
        ];
        extraSpecialArgs = {
          inherit inputs;
          inherit unstable;
          inherit mynvim;
          inherit quickshell;
          inherit noctalia;
          inherit spicetify-nix;
        };
      };
    };
}
