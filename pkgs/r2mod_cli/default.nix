{ fetchFromGitHub
, jq
, makeWrapper
, p7zip
, stdenv
}:

stdenv.mkDerivation rec {
  pname = "r2mod_cli";
  version = "1.0.6";

  src = fetchFromGitHub {
    owner = "Foldex";
    repo = "r2mod_cli";
    rev = "v${version}";
    sha256 = "0as3nl9qiyf9daf2n78lyish319qclf2gbhr20mdd5wnqmxpk276";

  };

  buildInputs = [
    jq
    makeWrapper
    p7zip
  ];

  phases = [ "installPhase" ];

  installPhase = ''
    mkdir -p "$out/bin"
    mkdir -p "$out/share/bash-completion/completions"
    mkdir -p "$out/share/zsh/site-functions"
    install -m 755 "$src/r2mod" "$out/bin/r2mod"
    install -m 644 "$src/completions/bash/r2mod.sh" "$out/share/bash-completion/completions/r2mod"
    install -m 644 "$src/completions/zsh/_r2mod" "$out/share/zsh/site-functions/_r2mod"
    wrapProgram $out/bin/r2mod \
      --prefix PATH : ${jq}/bin \
      --prefix PATH : ${p7zip}/bin
  '';

  meta = {
    description = "A Risk of Rain 2 Mod Manager in Bash";
    homepage = "https://github.com/foldex/r2mod_cli";
    license = stdenv.lib.licenses.gpl3;
  };

}
