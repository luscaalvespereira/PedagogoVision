<#
.SYNOPSIS
    PedagogoVision Studio - Launcher Autônomo em PowerShell
    Inicia o backend FastAPI, valida dependências e abre o frontend no navegador.
    Padrão de Conformidade: UTF-8 com BOM e quebras de linha CRLF.
#>

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

$ScriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
Set-Location -Path $ScriptDir

Write-Host "====================================================================" -ForegroundColor Cyan
Write-Host "            PEDAGOGOVISION STUDIO — MODO CRIAÇÃO ATIVO             " -ForegroundColor Yellow
Write-Host "   Transmutação Multimodal de Tarefas em Documentos Didáticos       " -ForegroundColor White
Write-Host "====================================================================" -ForegroundColor Cyan
Write-Host ""

# 1. Localização Robusta de Python
Write-Host "[1/3] Localizando interpretador Python no host..." -ForegroundColor DarkGray

$pyExe = $null

# Candidatos de comando
foreach ($cmd in @("python", "py", "python3")) {
    $c = Get-Command $cmd -ErrorAction SilentlyContinue
    if ($c) { $pyExe = $c.Source; break }
}

# Candidatos por caminho explícito (Windows Store / AppExecutionAlias / AppData)
if (-not $pyExe) {
    $caminhos = @(
        "$env:LOCALAPPDATA\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.12_qbz5n2kfra8p0\python.exe",
        "$env:LOCALAPPDATA\Microsoft\WindowsApps\python.exe",
        "$env:LOCALAPPDATA\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.13_qbz5n2kfra8p0\python.exe"
    )
    foreach ($p in $caminhos) {
        if (Test-Path $p) { $pyExe = $p; break }
    }
}

if (-not $pyExe) {
    Write-Host "[ERRO CRÍTICO] Python não foi encontrado automaticamente no sistema." -ForegroundColor Red
    Read-Host "Pressione ENTER para fechar..."
    exit 1
}

$pythonVersion = & $pyExe --version 2>&1
Write-Host "      Python localizado: $pyExe" -ForegroundColor Green
Write-Host "      Versão: $pythonVersion" -ForegroundColor Green

# 2. Instalação Silenciosa de Dependências
Write-Host "[2/3] Validando dependências essenciais em segundo plano..." -ForegroundColor DarkGray
& $pyExe -m pip install --quiet fastapi uvicorn pydantic python-multipart requests pillow

# 3. Disparo do Servidor e Abertura do Navegador
Write-Host "[3/3] Iniciando Servidor PedagogoVision na porta 5050..." -ForegroundColor DarkGray
Write-Host "      Interface Web disponível em: http://localhost:5050" -ForegroundColor Cyan
Write-Host ""
Write-Host "[SUCESSO] Abrindo PedagogoVision Studio no navegador padrão..." -ForegroundColor Green

Start-Process "http://localhost:5050"

# Executa o servidor FastAPI
& $pyExe "$ScriptDir\backend\server.py"
