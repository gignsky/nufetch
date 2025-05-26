{ config, pkgs, lib, ... }:
let
  neofetchCfg = config.programs.neofetch;
  enabledFields = lib.filterAttrs (_: v: v == true) (lib.removeAttrs neofetchCfg [ "enable" "extraFields" ]);
  extraFields = neofetchCfg.extraFields;
  configFile = pkgs.writeText "nufetch.conf" (
    lib.concatStringsSep "\n" (
      (lib.mapAttrsToList (k: _: "${k}=true") enabledFields)
      ++ (lib.mapAttrsToList (k: v: "${k}=${v}") extraFields)
    )
  );
in
{
  options = import ../lib/config-options.nix { inherit lib; };
  config = lib.mkIf config.programs.neofetch.enable {
    environment.systemPackages = [
      (pkgs.writeShellScriptBin "neofetch" ''
        exec ${pkgs.neofetch}/bin/neofetch --config /etc/nufetch.conf "$@"
      '')
    ];
    environment.etc."nufetch.conf".source = configFile;
  };
}
