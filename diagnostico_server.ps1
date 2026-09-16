$py = "C:\Users\lucas\AppData\Local\Microsoft\WindowsApps\PythonSoftwareFoundation.Python.3.12_qbz5n2kfra8p0\python.exe"
$serverScript = "c:\Users\lucas\OneDrive\pyQPanda-Tutorial\PedagogoVision\backend\server.py"

$outLog = "c:\Users\lucas\OneDrive\pyQPanda-Tutorial\PedagogoVision\server_out.log"
$errLog = "c:\Users\lucas\OneDrive\pyQPanda-Tutorial\PedagogoVision\server_err.log"

$proc = Start-Process -FilePath $py -ArgumentList $serverScript -RedirectStandardOutput $outLog -RedirectStandardError $errLog -PassThru
Start-Sleep -Seconds 2

Get-Content $outLog -ErrorAction SilentlyContinue
Get-Content $errLog -ErrorAction SilentlyContinue

if ($proc -and -not $proc.HasExited) {
    Stop-Process -Id $proc.Id -Force
}
