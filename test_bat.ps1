$deskBat = "C:\Users\lucas\OneDrive\Área de Trabalho\PedagogoVision\Iniciar_PedagogoVision.bat"
$log = "c:\Users\lucas\OneDrive\pyQPanda-Tutorial\PedagogoVision\bat_test_output.log"

$p = Start-Process -FilePath "cmd.exe" -ArgumentList "/c `"`"$deskBat`"`"" -RedirectStandardOutput $log -PassThru
Start-Sleep -Seconds 3

if (Test-Path $log) {
    Get-Content $log
}

if ($p -and -not $p.HasExited) {
    Stop-Process -Id $p.Id -Force
}
