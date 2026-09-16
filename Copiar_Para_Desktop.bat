@echo off
title Copiar PedagogoVision para o Desktop
cd /d "%~dp0"
echo =====================================================================
echo         PEDAGOGOVISION STUDIO — ENVIO PARA A AREA DE TRABALHO
echo =====================================================================
echo.

set "SOURCE=%~dp0"

:: Detecta se o Desktop esta no caminho padrao ou no OneDrive
set "TARGET_DESKTOP=%USERPROFILE%\Desktop"
if exist "%USERPROFILE%\OneDrive\Área de Trabalho" (
    set "TARGET_DESKTOP=%USERPROFILE%\OneDrive\Área de Trabalho"
) else if exist "%USERPROFILE%\OneDrive\Desktop" (
    set "TARGET_DESKTOP=%USERPROFILE%\OneDrive\Desktop"
) else if exist "D:\Desktop" (
    set "TARGET_DESKTOP=D:\Desktop"
)

set "DEST=%TARGET_DESKTOP%\PedagogoVision"

echo [1/2] Copiando pasta completa para a Area de Trabalho...
echo       Origem:  %SOURCE%
echo       Destino: %DEST%
echo.

xcopy "%SOURCE%*" "%DEST%\" /E /I /H /Y /Q >nul

echo [2/2] Criando atalho direto na Area de Trabalho...
powershell -NoProfile -Command "$ws = New-Object -ComObject WScript.Shell; $s = $ws.CreateShortcut('%TARGET_DESKTOP%\PedagogoVision Studio.lnk'); $s.TargetPath = '%DEST%\Iniciar_PedagogoVision.bat'; $s.WorkingDirectory = '%DEST%'; $s.Save()" >nul 2>&1

echo.
echo =====================================================================
echo  [CONCLUIDO COM SUCESSO]
echo  A pasta 'PedagogoVision' e o atalho estao agora no seu DESKTOP!
echo =====================================================================
echo.
pause
