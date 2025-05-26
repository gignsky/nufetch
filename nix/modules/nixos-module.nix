{ config, pkgs, lib, ... }:
let
  username = config.username;
  group = config.users.users.${username}.group or "users";
  home = config.users.users.${username}.home;
in
{
  options = import ../../config-options.nix { inherit lib; };
  config = lib.mkIf config.programs.neofetch.enable {
    environment.systemPackages = with pkgs; [
      neofetch
    ];
  };
}
