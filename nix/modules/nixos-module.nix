{ config, pkgs, outputs, lib, ... }:
let
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
        exec ${outputs.packages.${pkgs.system}.neofetch-nixos-module}/bin/neofetch --config /etc/nufetch.conf "$@"
      '')
      outputs.packages.${pkgs.system}.neofetch-nixos-module
    ];
    environment.etc."nufetch.conf".source = configFile;
  };
}
