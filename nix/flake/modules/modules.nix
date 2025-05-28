{ ... }:
{
  flake.nixosModules = {
    nufetch = {
      imports = [
        ../../modules/nixos-module.nix
        ../../lib/config-options.nix
        # ../../lib/config-maker.nix
      ];
    };
    default = self: self.nufetch;
  };

  flake.homeManagerModules = {
    nufetch = {
      imports = [
        ../../modules/home-manager-module.nix
        ../../lib/config-options.nix
        # ../../lib/config-maker.nix
      ];
    };
    default = self: self.nufetch;
  };
}
