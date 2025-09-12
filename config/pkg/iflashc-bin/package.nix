{ lib, stdenv, fetchurl, autoPatchelfHook, xorg, libGL, xclip }:

stdenv.mkDerivation rec {
  pname = "iflashc";
  version = "1.4.3";

  src = fetchurl {
    url = "https://github.com/alirezaarzehgar/iflashc/v${version}/latest/download/iflashc";
    hash = "sha256-Ao8L/feLdktap1ywxDdfvX/XMRTpU07l4uo7fNsEsHI=";
  };

  dontUnpack = true;

  nativeBuildInputs = [ autoPatchelfHook ];

  buildInputs = [
    xorg.libX11
    xorg.libXext
    xorg.libXrender
    xorg.libxcb
    xorg.libXau
    xorg.libXdmcp
    xorg.libXrandr
    xorg.libXxf86vm
    xorg.libXi
    xorg.libXcursor
    xorg.libXinerama

    libGL
    xclip
  ];

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    install -m755 -D $src $out/bin/iflashc
    ln -s ${xclip}/bin/xclip $out/bin/xclip
    runHook postInstall
  '';

  meta = with lib; {
    description = "Online dictionary with multiple translators like LLMs, google translate, freeapidictionary, fastdic.ir";
    homepage = "https://github.com/alirezaarzehgar/iflashc";
    license = licenses.unfree;
    platforms = [ "x86_64-linux" ];
    maintainers = with maintainers; [ alirezaarzehgar ];
  };
}
