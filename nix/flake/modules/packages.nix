{ inputs, ... }:
{
  perSystem = { pkgs, system, ... }:
    let
      patchedPkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [
          (import ../../overlays/neofetch-patch-nixos-module.nix)
        ];
      };
    in
    {
      packages.neofetch-nixos-module = patchedPkgs.neofetch;
    };
}
