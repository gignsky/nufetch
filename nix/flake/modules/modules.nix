{ inputs, lib, configLib, ... }:
{
  flake.nixosModules = {
    nufetch = {
      imports = [
        ../../modules/nixos-module.nix
      ];
    };
  };
}
