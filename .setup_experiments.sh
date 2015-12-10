methods="1_dtable many_dtable 1_maxsat 1_1_maxsat 2_maxsat 2_2_maxsat reforest"

test -f experiment_list || (
  for seq_name in \
    LinearExampleProof \
    LinearEqExampleProof \
    SquareDiagonalExampleProof \
    SquareEdgesExampleProof \
    SquareEdges2DimExampleProof \
    SumExampleProof \
    SumOfOnesF2ExampleProof \
    SumOfOnesFExampleProof \
    SumOfOnesExampleProof \
    UniformAssociativity3ExampleProof \
    FactorialFunctionEqualityExampleProof \
    FactorialFunctionEqualityExampleProof2 \

  do
    (set +x; for i in {0..100}; do echo "$seq_name($i)"; done)
  done

  find -L $proof_dir -not -type d
) | perl -ne '@m=split/ /,"'"$methods"'";/(.*)/;print"$1 $_\n" for @m' | shuf >experiment_list
