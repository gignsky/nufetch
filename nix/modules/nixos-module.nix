{ config, pkgs, lib, inputs, ... }:
let
  patchedPkgs = import inputs.nixpkgs {
    system = pkgs.system;
    overlays = [
      (import ../overlays/neofetch-patch-nixos-module.nix)
    ];
  };
  cfg = config.programs.nufetch;
  configFile = pkgs.writeText "nufetch.conf" (import ../lib/config-maker.nix { inherit cfg lib; });
in
{
  imports = [ ../lib/neofetch.nix ];
  config = lib.mkIf config.programs.nufetch.enable {
    environment.systemPackages = [
      #   (pkgs.writeShellScriptBin "neofetch" ''
      #     exec ${pkgs.neofetch}/bin/neofetch --config /etc/nufetch.conf "$@"
      #   '')
      (pkgs.writeShellScriptBin "nufetch" ''
        exec ${patchedPkgs.neofetch}/bin/neofetch --config /etc/nufetch.conf "$@"
      '')
      # patchedPkgs.neofetch
    ];
    environment.etc."nufetch.conf".source = configFile;
  };
}
