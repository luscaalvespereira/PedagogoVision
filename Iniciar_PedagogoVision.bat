@echo off
title PedagogoVision Studio - Launcher
cd /d "%~dp0"

echo =====================================================================
echo           PEDAGOGOVISION STUDIO - MODO CRIACAO ATIVO
echo   Transmutacao Multimodal de Tarefas em Documentos Didaticos
echo =====================================================================
echo.

:: 1. Localizacao Robusta do Python
echo [1/3] Localizando interpretador Python...
set "PY_EXE="

if exist "%LOCALAPPDATA%\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.12_qbz5n2kfra8p0\python.exe" (
    set "PY_EXE=%LOCALAPPDATA%\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.12_qbz5n2kfra8p0\python.exe"
    goto :found
)
if exist "%LOCALAPPDATA%\Microsoft\WindowsApps\python.exe" (
    set "PY_EXE=%LOCALAPPDATA%\Microsoft\WindowsApps\python.exe"
    goto :found
)
if exist "%LOCALAPPDATA%\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.13_qbz5n2kfra8p0\python.exe" (
    set "PY_EXE=%LOCALAPPDATA%\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.13_qbz5n2kfra8p0\python.exe"
    goto :found
)
where python >nul 2>&1
if %errorlevel% equ 0 (
    set "PY_EXE=python"
    goto :found
)
where py >nul 2>&1
if %errorlevel% equ 0 (
    set "PY_EXE=py -3"
    goto :found
)

:found
if "%PY_EXE%"=="" (
    echo [ERRO] Interpretador Python nao foi localizado.
    echo Por favor, certifique-se de que o Python 3.9+ esta instalado.
    pause
    exit /b 1
)

echo       Python localizado: "%PY_EXE%"
echo.

:: 2. Validacao de Dependencias
echo [2/3] Validando dependencias essenciais...
"%PY_EXE%" -m pip install --quiet fastapi uvicorn pydantic python-multipart requests pillow >nul 2>&1

:: 3. Inicializacao do Servidor
echo [3/3] Servidor PedagogoVision iniciando na porta 5050...
echo       Interface Web: http://localhost:5050
echo.
echo [SUCESSO] Abrindo navegador...
start "" "http://localhost:5050"

"%PY_EXE%" "%~dp0backend\server.py"
pause
