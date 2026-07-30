param(
[string]$Business,
[string]$City
)

Write-Host "=== ONE BUTTON WEBSITE FACTORY ==="

.\submit-order.ps1 `
-Business $Business `
-City $City

Start-Sleep -Seconds 2

.\queue-worker.ps1

Write-Host ""
Write-Host "=== DELIVERY FINISHED ==="
