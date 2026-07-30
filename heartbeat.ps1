while ($true) {

Write-Host "=== WEBSITE FACTORY HEARTBEAT ==="

Get-Date

if (Test-Path controller\queue) {
    $jobs = (Get-ChildItem controller\queue\*.json -ErrorAction SilentlyContinue).Count
    Write-Host "Queued Jobs:" $jobs
}

Write-Host "Factory Status: ONLINE"

Start-Sleep -Seconds 300
}
