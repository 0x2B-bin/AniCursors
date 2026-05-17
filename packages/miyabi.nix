{
  stdenvNoCC,
  fetchurl
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  name = "miyabi-cursors";

  src = ../src/Miyabi;

  installPhase = ''
    runHook preinstall

    mkdir -p $out/share/icons/miyabi
    cp -r ./* $out/share/icons/miyabi

    runHook postInstall
  '';
})
