@echo off
setlocal enabledelayedexpansion
title Publicar PedagogoVision no GitHub
cd /d "%~dp0"

echo =====================================================================
echo            PEDAGOGOVISION STUDIO — PUBLICACAO NO GITHUB
echo =====================================================================
echo.

:: 1. Verifica Git
where git >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERRO] O comando 'git' nao foi encontrado no sistema.
    echo Instale o Git para Windows ou execute via GitHub Desktop.
    pause
    exit /b 1
)

:: 2. Inicializa o repositorio se necessario
if not exist ".git" (
    echo [1/4] Inicializando repositorio Git local...
    git init -b main
) else (
    echo [1/4] Repositorio Git local ja inicializado.
)

:: 3. Adiciona arquivos e realiza commit
echo [2/4] Indexando arquivos do projeto...
git add .
git commit -m "feat: initial commit - PedagogoVision Studio v1.0 (Metodo I.D.E.A.L.)"

:: 4. Solicita a URL remota do GitHub caso ainda nao exista
git remote | findstr "origin" >nul 2>&1
if %errorlevel% neq 0 (
    echo.
    echo =====================================================================
    echo [3/4] Configuracao do Repositorio Remoto no GitHub:
    echo Crie um repositorio vazio no seu GitHub (ex: https://github.com/SEU_USER/PedagogoVision.git)
    echo =====================================================================
    set /p REPO_URL="Cole aqui a URL do seu repositorio no GitHub: "
    if not "!REPO_URL!"=="" (
        git remote add origin !REPO_URL!
    )
) else (
    echo [3/4] Repositorio remoto 'origin' ja configurado.
)

:: 5. Push para o GitHub
echo.
echo [4/4] Enviando codigo para o branch 'main' no GitHub...
git push -u origin main

echo.
echo =====================================================================
echo  [CONCLUIDO] Seus arquivos estao salvos e prontos no GitHub!
echo =====================================================================
pause
