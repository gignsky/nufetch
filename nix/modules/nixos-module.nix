{ config, pkgs, lib, ... }:
let
  nufetchCfg = config.programs.nufetch;
  enabledFields = lib.filterAttrs (_: v: v == true) (lib.removeAttrs nufetchCfg [ "enable" "extraFields" ]);
  extraFields = nufetchCfg.extraFields;
  configFile = pkgs.writeText "nufetch.conf"
    (import ../lib/config-maker.nix { cfg = nufetchCfg; lib = lib; });
in
{
  imports = [ ../lib/neofetch.nix ];
  config = lib.mkIf config.programs.nufetch.enable {
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
