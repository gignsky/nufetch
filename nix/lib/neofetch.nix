{ config, lib, pkgs, ... }:
let
  configOptions = import ./config-options.nix { inherit lib; };
  cfg = config.programs.nufetch;
  configFile = pkgs.writeText "nufetch.conf" (import ./config-maker.nix { inherit cfg lib; });
in
{
  options = import ./config-options.nix { inherit lib; };
  config = lib.mkIf config.programs.nufetch.enable {
    environment.systemPackages = [ pkgs.neofetch ];
    environment.etc."nufetch.conf".source = configFile;
  };
}
