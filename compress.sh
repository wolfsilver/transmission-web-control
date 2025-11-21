#!/usr/bin/env bash
set -euo pipefail

src_dir="./src/tr-web-control/script"
min_dir="$src_dir/min"
mkdir -p "$min_dir"

# Ensure terser is available: use npx (no install) or install terser: npm i -D terser
for f in "$src_dir"/*.js; do
  filename=$(basename "$f")
  # skip already minified files
  if [[ "$filename" == *.min.js ]]; then
    continue
  fi
  out="$min_dir/${filename%.js}.min.js"
  echo "Minifying $filename -> $(basename "$out")"
  npx terser "$f" -c -m -o "$out"
done

echo "Done."
