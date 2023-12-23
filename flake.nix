{
  description = "Ocaml project using `ocaml-flake` and `flake-parts`";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs @ {flake-parts, ...}:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin"];
      perSystem = {pkgs, ...}: {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            ocaml
            ocamlPackages.dune_3
            ocamlPackages.utop
            ocamlPackages.ocaml-lsp
            ocamlformat
          ];
        };
      };
    };
}
