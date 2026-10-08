# Setting this up on a computer

Goal: run an uncensored Qwen text model locally (adult fiction/roleplay, 18+ only), much bigger and faster than on the phone.

## 1. Pick hardware tier (see MODELS.md for repos)
| Your machine | Run this size | Notes |
|---|---|---|
| 8 GB RAM, no GPU | 2B-4B Q4 | same as phone, a bit faster |
| 16 GB RAM, no GPU | 9B Q4_K_M (~5.5 GB) | CPU only, ~3-6 tok/s |
| GPU with 8 GB VRAM | 9B Q4_K_M fully on GPU | fast |
| GPU with 16-24 GB VRAM | 27B Q4 (~16 GB) or 35B-A3B MoE | best quality/price |
| Apple Silicon 32 GB+ unified | 27B Q4 | works well with Ollama/LM Studio |

Rule of thumb: model file size + ~2 GB for context must fit in VRAM (or RAM for CPU).

## 2. Install a runtime (pick one)
- **Ollama** (simplest): https://ollama.com/download (Windows/macOS/Linux). Same tool used on the phone.
- **LM Studio** (GUI, handles GGUF + chat UI): https://lmstudio.ai
- **llama.cpp** (most control): https://github.com/ggml-org/llama.cpp/releases

## 3. Get the model
With Ollama installed, the easiest path is to pull straight from Hugging Face:
```
ollama pull hf.co/<repo>:<quant>
# e.g. ollama pull hf.co/mradermacher/Huihui-Qwen3.5-9B-abliterated-GGUF:Q4_K_M
```
or use the helper: `./scripts/pull-desktop.sh <repo> <quant> <name>` (Linux/macOS/Git Bash) or `scripts/pull-desktop.ps1` (Windows PowerShell).
It pulls the model, then creates a named model with the system prompt/params from `scripts/Modelfile.template`.

## 4. Chat
- Terminal: `ollama run <name>`
- Nicer UI for roleplay: SillyTavern (https://github.com/SillyTavern/SillyTavern) pointed at Ollama's API `http://localhost:11434`, or Open WebUI.
- Character cards / persona go in the frontend; keep the Modelfile SYSTEM prompt generic.

## 5. Move this project
```
git clone https://github.com/MADavisFS20/Qwen-Uncensored-Local.git
```
Private repo: log in first with `gh auth login` (GitHub CLI) or use a personal access token over HTTPS.
Model files (*.gguf) are NOT in the repo; re-download them on the new machine.

## 6. Optional: train your own (needs an NVIDIA GPU, 16-24 GB VRAM for 7-9B LoRA)
See FINETUNE.md.
