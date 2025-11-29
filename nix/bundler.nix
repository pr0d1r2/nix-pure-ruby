{ sources ? import ./sources.nix }:
let
  pkgs = import sources.nixpkgs {};
  ruby = import ./ruby.nix {};
in
pkgs.bundler.override {
  inherit ruby;
}
