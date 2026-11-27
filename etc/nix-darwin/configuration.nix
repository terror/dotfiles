{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.nil
    pkgs.nixfmt
  ];

  nix.enable = false;

  nixpkgs.hostPlatform = "aarch64-darwin";

  system.primaryUser = "liam";

  system.stateVersion = 6;
}
