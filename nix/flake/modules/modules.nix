{ inputs, system, ... }:
let
  patchedPkgs = import inputs.nixpkgs {
    inherit system;
    overlays = [
      (import ../../overlays/neofetch-patch-nixos-module.nix)
    ];
  };
in
{
  flake.nixosModules = {
    nufetch = {
      imports = [
        ../../modules/nixos-module.nix
        { inherit patchedPkgs; }
        ../../lib/config-options.nix
        # ../../lib/config-maker.nix
      ];
    };
    default = self: self.nufetch;
  };
}
