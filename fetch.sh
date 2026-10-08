#!/data/data/com.termux/files/usr/bin/bash
# Download a GGUF, then register it with ollama using the folder's Modelfile.
set -e
cd "$(dirname "$0")"
case "$1" in
  2b) dir=qwen3.5-2b-uncensored-ara; repo=mradermacher/Qwen3.5-2B-uncensored-ara-GGUF; f=Qwen3.5-2B-uncensored-ara.Q4_K_M.gguf; name=qwen-2b-uncensored ;;
  4b) dir=qwen3-4b-instruct-2507-abliterated; repo=mradermacher/Huihui-Qwen3-4B-Instruct-2507-abliterated-GGUF; f=Huihui-Qwen3-4B-Instruct-2507-abliterated.Q3_K_M.gguf; name=qwen-4b-uncensored ;;
  *) echo "usage: $0 2b|4b"; exit 1 ;;
esac
[ -f "$dir/$f" ] || curl -L -C - -o "$dir/$f" "https://huggingface.co/$repo/resolve/main/$f"
(cd "$dir" && ollama create "$name" -f Modelfile)
echo "Done. Run: ollama run $name"
