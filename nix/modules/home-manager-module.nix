{ config, pkgs, lib, ... }:
let
  cfg = config.programs.nufetch;
  configFile = pkgs.writeText "config.conf" (import ../lib/config-maker.nix { inherit cfg lib; });
in
{
  config = lib.mkIf config.programs.nufetch.enable {
    home.packages = [
      #   (pkgs.writeShellScriptBin "neofetch" ''
      #     exec ${pkgs.neofetch}/bin/neofetch --config /etc/nufetch.conf "$@"
      #   '')
      (pkgs.writeShellScriptBin "nufetch" ''
        exec ${pkgs.neofetch}/bin/neofetch "$@"
      '')
      pkgs.neofetch
    ];
    home.file.".config/neofetch/config.conf".source = configFile;
  };
}
