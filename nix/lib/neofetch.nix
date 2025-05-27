{ config, lib, pkgs, ... }:
{
  options = import ./config-options.nix { inherit lib; };
  config = lib.mkIf config.programs.nufetch.enable {
    environment.systemPackages = [ pkgs.neofetch ];
    # environment.etc."nufetch.conf".source = configFile;
  };
}
