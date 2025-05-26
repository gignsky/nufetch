{ inputs, lib, configLib, ... }:
{
  flake.nixosModules = {
    nufetch = {
      imports = [
        ../../modules/nixos-module.nix
        ../../lib/config-options.nix
        ../../lib/config-maker.nix
      ];
    };
  };
}
