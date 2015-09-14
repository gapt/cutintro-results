with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "cutintro-experiments";
  buildInputs = with python34Packages; [
    ipython nbconvert notebook
    pandas matplotlib
    sbt openjdk8
    prover9 veriT
  ];
}
