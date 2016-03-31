xz -9c gapt/experiments/results.json >$log_dir/results.json.xz

./do_analysis.sh $current_date || true

ln -sf $current_date/results.json.xz latest_results.json.xz
git add latest_results.json.xz $current_date
git commit -m "Experiment results from $current_date."
git pull --rebase
git push
