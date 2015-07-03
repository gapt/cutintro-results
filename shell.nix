with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "cutintro-experiments";
  buildInputs = with python34Packages; [
    ipython
    pandas matplotlib
    sbt openjdk8
    prover9 veriT
  ];
}
