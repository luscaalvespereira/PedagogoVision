$desk = [Environment]::GetFolderPath('Desktop')
if (-not $desk -or -not (Test-Path $desk)) {
    if (Test-Path "$env:USERPROFILE\OneDrive\Área de Trabalho") {
        $desk = "$env:USERPROFILE\OneDrive\Área de Trabalho"
    } elseif (Test-Path "$env:USERPROFILE\OneDrive\Desktop") {
        $desk = "$env:USERPROFILE\OneDrive\Desktop"
    } else {
        $desk = "$env:USERPROFILE\Desktop"
    }
}

$destPath = Join-Path $desk "PedagogoVision"
Copy-Item -Path "c:\Users\lucas\OneDrive\pyQPanda-Tutorial\PedagogoVision" -Destination $destPath -Recurse -Force

# Cria atalho na Area de Trabalho
$ws = New-Object -ComObject WScript.Shell
$shortcut = $ws.CreateShortcut((Join-Path $desk "PedagogoVision Studio.lnk"))
$shortcut.TargetPath = (Join-Path $destPath "Iniciar_PedagogoVision.bat")
$shortcut.WorkingDirectory = $destPath
$shortcut.Save()

Write-Output "SUCESSO_TOTAL_COPIADO: $destPath"
