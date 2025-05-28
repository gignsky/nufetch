{ pkgs ? import <nixpkgs> { overlays = [ (import ./nix/overlays/neofetch-patch-nixos-module.nix) ]; } }:

pkgs.neofetch
