# Qwen-Uncensored-Local

Local, uncensored Qwen text models for adult fiction/roleplay, packaged like PinkCherry-NSFW_MiniMax-H3:
one folder per model, each with a Modelfile, plus a fetch script. Weights are NOT stored here (GGUFs are 1-3 GB);
`fetch.sh` downloads them. For adult (18+) users and consensual fiction only.

Device: 8 cores, ~3.6 GB RAM, no GPU, so only small quants fit.

| Folder | Source (community abliterated build) | Quant | Size |
|---|---|---|---|
| qwen3.5-2b-uncensored-ara | mradermacher/Qwen3.5-2B-uncensored-ara-GGUF | Q4_K_M | 1.27 GB (safe pick) |
| qwen3-4b-instruct-2507-abliterated | mradermacher/Huihui-Qwen3-4B-Instruct-2507-abliterated-GGUF | Q3_K_M | 2.08 GB (tight; close other apps) |

Use: `./fetch.sh 2b` (or `4b`), then `ollama run qwen-2b-uncensored` (or `qwen-4b-uncensored`).

## Moving to a computer
See `docs/DESKTOP_SETUP.md` (hardware tiers, install, pull bigger models), `docs/MODELS.md` (candidate repos),
`docs/FINETUNE.md` + `finetune/train_lora.py` (optional own training, untested template), `scripts/pull-desktop.*` (one-command model pull).
