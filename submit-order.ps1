param(
[string]$Business,
[string]$City
)

Write-Host "=== LIVE FACTORY TEST ==="

.\queue-job.ps1 `
-Business $Business `
-City $City

Write-Host "Job submitted to automation queue"

Get-ChildItem controller\queue
