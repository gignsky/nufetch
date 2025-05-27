{ inputs, ... }:
{
  perSystem = { pkgs, ... }: {
    packages.neofetch-nixos-module = pkgs.neofetch;
  };
}
