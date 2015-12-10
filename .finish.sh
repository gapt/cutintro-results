cp gapt/experiments/results.json $log_dir

./do_analysis.sh $current_date || true

git add $current_date
git commit -m "Experiment results from $current_date."
git pull --rebase
git push
