{ lib, stdenv, fetchurl, buildGoModule, fetchFromGitHub }:

buildGoModule rec {
  pname = "git-llm";
  version = "1.0.0";

  src = fetchFromGitHub {
    owner = "alirezaarzehgar";
    repo = "git-llm";
    tag = "v${version}";
    hash = "sha256-1s6bG+E6mjWcLmWZ2BBUJualf2atPdiXK31lreuNclw=";
  };

  vendorHash = "sha256-kkI0ZVL1zMuKF+9gKSog9dJElbIBoBUUd+M6+20K+sc=";
  proxyVendor = true;

  meta = with lib; {
    description = "git subcommand to integrate git with large language models ";
    homepage = "https://github.com/alirezaarzehgar/git-llm";
    license = licenses.gpl3;
    maintainers = with maintainers; [ alirezaarzehgar ];
  };
}
