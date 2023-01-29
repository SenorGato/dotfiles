{
  description = "SenoraRaton's special snow-flake'";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };

      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        senoraraton = lib.nixosSystem {
          inherit system;
          modules = [ ./configuration.nix ];
        };
      };
  };
}
