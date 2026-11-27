{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    { nix-darwin, ... }:
    {
      darwinConfigurations."Liams-MacBook-Pro" = nix-darwin.lib.darwinSystem {
        modules = [ ./configuration.nix ];
      };
    };
}
