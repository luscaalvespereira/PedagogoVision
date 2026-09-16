$candidates = @()

foreach ($cmd in @("py", "python", "python3")) {
    $c = Get-Command $cmd -ErrorAction SilentlyContinue
    if ($c) { $candidates += "COMMAND: $cmd -> $($c.Source)" }
}

$pathsToSearch = @(
    "$env:LOCALAPPDATA\Programs\Python",
    "C:\Program Files\Python*",
    "C:\Python*",
    "$env:LOCALAPPDATA\Microsoft\WindowsApps",
    "D:\Python*",
    "D:\Cerebro_Virtual"
)

foreach ($p in $pathsToSearch) {
    if (Test-Path $p) {
        $exes = Get-ChildItem -Path $p -Filter "python.exe" -Recurse -Depth 3 -ErrorAction SilentlyContinue
        foreach ($e in $exes) {
            $candidates += "PATH: $($e.FullName)"
        }
    }
}

$regPaths = @(
    "HKCU:\Software\Python\PythonCore",
    "HKLM:\Software\Python\PythonCore"
)

foreach ($rp in $regPaths) {
    if (Test-Path $rp) {
        $subkeys = Get-ChildItem -Path $rp -ErrorAction SilentlyContinue
        foreach ($sk in $subkeys) {
            $ip = Join-Path $sk.PSPath "InstallPath"
            if (Test-Path $ip) {
                $val = (Get-ItemProperty -Path $ip -ErrorAction SilentlyContinue).'(default)'
                if ($val) {
                    $candidates += "REGISTRY: $val\python.exe (Exists: $(Test-Path "$val\python.exe"))"
                }
            }
        }
    }
}

$candidates | Out-File -FilePath "c:\Users\lucas\OneDrive\pyQPanda-Tutorial\PedagogoVision\python_detectado.txt" -Encoding utf8
Write-Output ($candidates -join "`n")
