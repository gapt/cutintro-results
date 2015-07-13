#!/usr/bin/env bash
set -ex

current_date=`date +%Y-%m-%d`

mkdir $current_date
log_dir=`readlink -f $current_date`

[ -d gapt ] || git clone https://github.com/gapt/gapt

pushd gapt

  git clean -fdx
  git pull
  git show --summary >$log_dir/revision.txt

  pushd testing/TSTP
    ./get-proofs prover9
  popd
  pushd testing/veriT-SMT-LIB
    tar xf veriT-SMT-LIB-QF_UF.tar.gz
  popd

  sbt 'testing/run-main at.logic.gapt.testing.testCutIntro'

  cp results.json $log_dir

popd

./do_analysis.sh $current_date || true

git add $current_date
git commit -m "Experiment results from $current_date."
git pull --rebase
git push
