#!/usr/bin/env bash
# usage: ./scripts/pull-desktop.sh <hf-repo> <quant> <name>
# e.g.   ./scripts/pull-desktop.sh mradermacher/Huihui-Qwen3.5-9B-abliterated-GGUF Q4_K_M qwen-9b-uncensored
set -e
[ $# -eq 3 ] || { sed -n '2,3p' "$0"; exit 1; }
repo=$1; quant=$2; name=$3
cd "$(dirname "$0")"
ollama pull "hf.co/$repo:$quant"
tmp=$(mktemp)
sed -e "s|__REPO__|$repo|" -e "s|__QUANT__|$quant|" Modelfile.template > "$tmp"
ollama create "$name" -f "$tmp"
rm -f "$tmp"
echo "Done. Run: ollama run $name"
