{
  lib,
  stdenv,
  fetchFromGitHub,
  zlib,
}:

stdenv.mkDerivation rec {
  pname = "seqtk";
  version = "1.4";

  src = fetchFromGitHub {
    owner = "lh3";
    repo = "seqtk";
    rev = "e6ac98dc93cc6a4d305d8e37f5555868376037b6";
    hash = "sha256-vfLDe7y0L9nLNs2pbU10e7wJOOLNUul7dgDGAvKX5MU=";
  };

  buildInputs = [ zlib ];
  makeFlags = [ "CC=${stdenv.cc.targetPrefix}cc" ];
  hardeningDisable = [ "all" ];

  installPhase = ''
    mkdir -p $out/bin
    cp seqtk $out/bin/
  '';

  meta = with lib; {
    description = "Toolkit for processing sequences in FASTA/Q formats";
    homepage = "https://github.com/lh3/seqtk";
    license = licenses.mit;
    platforms = platforms.unix;
    maintainers = with maintainers; [ ];
  };
}
