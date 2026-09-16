$py = "C:\Users\lucas\AppData\Local\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.12_qbz5n2kfra8p0\python.exe"
$serverScript = "c:\Users\lucas\OneDrive\pyQPanda-Tutorial\PedagogoVision\backend\server.py"

$proc = Start-Process -FilePath $py -ArgumentList $serverScript -PassThru
Start-Sleep -Seconds 3

try {
    $res = Invoke-RestMethod -Uri "http://127.0.0.1:5050/api/status" -TimeoutSec 3
    Write-Output "STATUS_OK: $($res.status)"
    Write-Output "APP: $($res.app)"
    Write-Output "DB: $($res.banco_dados)"
} catch {
    Write-Output "ERRO: $($_.Exception.Message)"
} finally {
    if ($proc -and -not $proc.HasExited) {
        Stop-Process -Id $proc.Id -Force
    }
}
