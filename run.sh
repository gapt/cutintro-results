#!/usr/bin/env bash
set -ex

tstp_files=`readlink -f Solutions`
if [ ! -d $tstp_files ]; then
  echo $tstp_files must be a directory containing the TSTP solutions.
  exit 1
fi

do_experiments=`readlink -f do_experiments.sh`

current_date=`date +%Y-%m-%d`

mkdir $current_date
log_dir=`readlink -f $current_date`

[ -d gapt ] || git clone https://github.com/gapt/gapt

pushd gapt

  # git clean -fdx
  git pull
  git show --summary >$log_dir/revision.txt

  pushd testing/veriT-SMT-LIB
    tar xf veriT-SMT-LIB-QF_UF.tar.gz
    verit_files=`readlink -f QF_UF`
  popd

  sbt testing/assembly
  gapt_jar=`readlink -f testing/target/scala-*/gapt-testing-assembly*.jar`

  mkdir experiments
  pushd experiments
    mkdir proofs
    ln -s $verit_files $tstp_files proofs

    $do_experiments $gapt_jar

    cp results.json $log_dir
  popd

popd

./do_analysis.sh $current_date || true

git add $current_date
git commit -m "Experiment results from $current_date."
git pull --rebase
git push
