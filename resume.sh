#!/usr/bin/env bash
set -ex

current_date=`ls -d [0-9]???-??-?? | sort | tail -n1`
log_dir=`readlink -f $current_date`

do_experiments=`readlink -f .do_experiments.sh`

pushd gapt

  gapt_jar=`readlink -f testing/target/scala-*/gapt-testing-assembly*.jar`

  pushd experiments
    . $do_experiments
  popd

popd

. ./.finish.sh
