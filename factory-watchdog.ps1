param(
[int]$Seconds = 60
)

Write-Host "=== FACTORY WATCHDOG ONLINE ==="

while ($true) {

    $jobs = Get-ChildItem controller\queue\*.json -ErrorAction SilentlyContinue

    if ($jobs.Count -gt 0) {
        Write-Host "Jobs detected. Starting worker..."
        .\queue-worker.ps1
    }
    else {
        Write-Host "No jobs. Factory standing by..."
    }

    Start-Sleep -Seconds $Seconds
}
