{ config, pkgs, lib, ... }:
let
  neofetchCfg = config.programs.neofetch;
  enabledFields = lib.filterAttrs (_: v: v == true) (lib.removeAttrs neofetchCfg [ "enable" "extraFields" ]);
  extraFields = neofetchCfg.extraFields;
  configFile = pkgs.writeText "nufetch.conf"
    (import ../lib/config-maker.nix { cfg = neofetchCfg; lib = lib; });
in
{
  imports = [ ../lib/neofetch.nix ];
  config = lib.mkIf config.programs.neofetch.enable {
    environment.systemPackages = [
      (pkgs.writeShellScriptBin "neofetch" ''
        exec ${pkgs.neofetch}/bin/neofetch --config /etc/nufetch.conf "$@"
      '')
      (pkgs.writeShellScriptBin "nufetch" ''
        exec ${pkgs.neofetch}/bin/neofetch --config /etc/nufetch.conf "$@"
      '')
    ];
    environment.etc."nufetch.conf".source = configFile;
  };
}
