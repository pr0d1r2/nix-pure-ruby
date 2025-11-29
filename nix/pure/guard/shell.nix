{ sources ? import ../../sources.nix }:
let
  pkgs = import sources.nixpkgs {};

  ruby = import ../../ruby.nix {};
  bundler = import ../../bundler.nix {};
  bundix = import ../../bundix.nix {};

  rubyEnv = pkgs.bundlerEnv.override { inherit bundler; } {
    name = "nix-pure-guard-gems";
    inherit ruby;
    gemdir = ./.;
  };

  shellDeps = [
    bundix
    pkgs.bash
    rubyEnv
    rubyEnv.wrappedRuby
  ];
in

pkgs.mkShell {
  buildInputs = shellDeps;

  shellHook = ''
    bundle install --quiet
  '';
}
