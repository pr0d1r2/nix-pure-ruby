{ sources ? import ./nix/sources.nix }:
let
  pkgs = import sources.nixpkgs {};

  shellDeps = [
    pkgs.git
    pkgs.ripgrep
  ];
in

pkgs.mkShell {
  buildInputs = shellDeps;

  shellHook = ''
    export PATH="$PWD/bin:$PATH"
  '';
}
