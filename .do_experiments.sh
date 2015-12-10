parallel --timeout 60 \
  --colsep ' ' \
  --files --results results \
  --joblog joblog --resume \
  --progress \
  java -cp $gapt_jar \
  -Xmx1G -Xss40m \
  -XX:ParallelGCThreads=1 -XX:ConcGCThreads=1 \
  at.logic.gapt.testing.testCutIntro '{1}' '{2}' \
  :::: experiment_list || true

pushd results
  java -cp $gapt_jar at.logic.gapt.testing.collectExperimentResults >../results.json
popd
