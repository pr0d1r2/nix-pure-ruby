{ sources ? import ./sources.nix }:
let
  pkgs = import sources.nixpkgs {};
in
pkgs.ruby_3_4
