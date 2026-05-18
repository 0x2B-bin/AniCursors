{
  description = "AniCursors: Collection of anime cursors";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
        "aarch64-linux"
        "x86_64-darwin"
        "x86_64-linux"
      ];

      perSystem = { pkgs, lib, self', ... }:
        let
          mkCursor = pkgs.callPackage ./packages/mkCursor.nix {};
          cursorNames = [
            "miyabi_blz"
          ];

          cursorSet = lib.genAttrs cursorNames (name: mkCursor { inherit name; });
        in
        {
          packages = cursorSet // {
            all = pkgs.symlinkJoin {
              name = "anicursors-all";
              paths = builtins.attrValues cursorSet;
            };

            default = self'.packages.all;
          };
        };
    };
}
