{
  description = "AniCursors: Collection of anime cursors";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = inputs: {
    packages = builtins.mapAttrs (
      system: pkgs:
      let
        mkCursor = pkgs.callPackage ./packages/mkCursor.nix { };
        cursorNames = builtins.attrNames (builtins.readDir ./src);
        cursorSet = pkgs.lib.genAttrs cursorNames (name: mkCursor { inherit name; });
      in
      (
        args@{ ... }:
        args
        // {
          all = pkgs.symlinkJoin {
            name = "anicursors-all";
            paths = builtins.attrValues cursorSet;
          };
          default = inputs.self.packages.${system}.all;
        }
      )
        cursorSet
    ) inputs.nixpkgs.legacyPackages;
  };
}
