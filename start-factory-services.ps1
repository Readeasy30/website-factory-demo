Write-Host "=== AUTOMATION SERVICE START ==="

Start-Job -ScriptBlock {
    Set-Location C:\Users\Wholelychit\website-factory
    .\factory-watchdog.ps1
}

Start-Job -ScriptBlock {
    Set-Location C:\Users\Wholelychit\website-factory
    while ($true) {
        .\order-worker.ps1
        Start-Sleep -Seconds 60
    }
}

Write-Host "FACTORY SERVICES RUNNING"
Get-Job
