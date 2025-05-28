{ config, lib, ... }:
{
  options = import ./config-options.nix { inherit lib; };
  config = lib.mkIf config.programs.nufetch.enable { };
}
