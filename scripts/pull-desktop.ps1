# usage: .\scripts\pull-desktop.ps1 -Repo mradermacher/Huihui-Qwen3.5-9B-abliterated-GGUF -Quant Q4_K_M -Name qwen-9b-uncensored
param([Parameter(Mandatory)][string]$Repo, [Parameter(Mandatory)][string]$Quant, [Parameter(Mandatory)][string]$Name)
$ErrorActionPreference = "Stop"
ollama pull "hf.co/${Repo}:${Quant}"
$tmp = New-TemporaryFile
(Get-Content "$PSScriptRoot\Modelfile.template") -replace '__REPO__', $Repo -replace '__QUANT__', $Quant | Set-Content $tmp
ollama create $Name -f $tmp
Remove-Item $tmp
Write-Host "Done. Run: ollama run $Name"
