{ config, lib, pkgs, ... }:
let
  configOptions = import ./config-options.nix { inherit lib; };
  cfg = config.programs.nufetch;
  configFile = import ./config-maker.nix { inherit config lib; };
in
{
  options = import ./config-options.nix { inherit lib; };
  config = lib.mkIf config.programs.neofetch.enable {
    environment.systemPackages = [ pkgs.neofetch ];
    environment.etc."nufetch.conf".source = configFile;
  };
}
