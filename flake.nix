{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
        unlink = pkgs.stdenv.mkDerivation rec {
          name = "unlink";
          src = ./.;
          buildInputs = with pkgs; [nushell];
          installPhase = ''
            mkdir -p $out/bin
            cp ./main.nu $out/bin/${name}
            chmod +x $out/bin/${name}
          '';
        };
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            nushell
            unlink
          ];
        };

        packages.default = unlink;
        packages.unlink = unlink;
      }
    );
}
