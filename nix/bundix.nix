{ sources ? import ./sources.nix }:
let
pkgs = import sources.nixpkgs {};
bundler = import ./bundler.nix {};
in
pkgs.bundix.override {
  inherit bundler;
}
