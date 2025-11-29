{ sources ? import ../../sources.nix }:
let
  pkgs = import sources.nixpkgs {};

  ruby = import ../../ruby.nix {};
  bundler = import ../../bundler.nix {};
  bundix = import ../../bundix.nix {};

  shellDeps = [
    bundix
    bundler
    pkgs.curl
    ruby
  ];
in

pkgs.mkShell {
  buildInputs = shellDeps;

  shellHook = ''
    echo
  '';
}
