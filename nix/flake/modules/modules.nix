{ inputs, lib, configLib, ... }:
{
  flake.nixosModules = {
    nufetch = {
      imports = [
        ../../modules/nixos-module.nix
        ../../modules/config-options.nix
        ../../modules/config-maker.nix
      ];
    };
  };
}
