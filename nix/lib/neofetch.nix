{ config, lib, pkgs, ... }:
{
  options = import ./config-options.nix { inherit lib; };
  config = lib.mkIf config.programs.nufetch.enable { };
}
