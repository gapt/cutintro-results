with import <nixpkgs> {};
stdenv.mkDerivation {
  name = "cutintro-experiments";
  buildInputs = with python3Packages; [
    jupyter
    pandas matplotlib
    sbt openjdk8
    prover9 z3
    parallel
  ];
}
