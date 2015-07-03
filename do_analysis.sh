#!/usr/bin/env bash

if [ ! -d "$1" ]; then
  echo "Usage: ./do_analysis.sh YYYY-MM-DD"
  exit 1
fi

set -x
cd "$1"

sed '
  s@filename = \\".*\\"@filename = \\"CutIntroDataLog.txt\\"@;
  s@previous_filename = \\".*\\"@previous_filename = \\"../2015-03-15/CutIntroDataLog.txt\\"@;
' ../cutintro.ipynb >cutintro.ipynb
ipython3 nbconvert --inplace --execute --to notebook cutintro.ipynb
