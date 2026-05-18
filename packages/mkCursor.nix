{
  stdenvNoCC,
  lib
}:
{ name, src ? ../src/${name} }:
stdenvNoCC.mkDerivation (finalAttrs: {
  name = (lib.toLower name) + "-cursors";

  inherit src;

  installPhase = ''
    runHook preinstall

    mkdir -p $out/share/icons/${name}
    cp -r ./* $out/share/icons/${name}

    runHook postInstall
  '';
})
