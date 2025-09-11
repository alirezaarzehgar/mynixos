{ lib, stdenv, fetchurl, buildGoModule, fetchFromGitHub, xorg, libGL, xclip
, pkg-config }:

buildGoModule rec {
  pname = "iflashc";
  version = "1.4.3";

  src = fetchFromGitHub {
    owner = "alirezaarzehgar";
    repo = "iflashc";
    tag = "v${version}";
    hash = "sha256-KTKGS3AicSG/axlZWkVu5oRlZHQssBlC1ojfcvksso8=";
  };

  ldflags = [
    "-s"
    "-w"
    "-X github.com/alirezaarzehgar/iflashc/cmd.Version=${version}"
  ];

  nativeBuildInputs = [ pkg-config xclip ];

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
  ];

  vendorHash = "sha256-x1/4JiPtNTI3KXvhe+RphzN0rQQrRwzq3IyMHXPVZRg=";
  proxyVendor = true;

  postInstall = ''
    ln -s ${xclip}/bin/xclip $out/bin/xclip
  '';

  meta = with lib; {
    description =
      "Online dictionary with multiple translators like LLMs, google translate, freeapidictionary, fastdic.ir";
    homepage = "https://github.com/alirezaarzehgar/iflashc";
    license = licenses.gpl3;
    maintainers = with maintainers; [ alirezaarzehgar ];
  };
}
