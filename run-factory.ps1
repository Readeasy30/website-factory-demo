param(
[string]$Business,
[string]$City
)

Write-Host "=== WEBSITE FACTORY START ==="

.\receive-order.ps1 `
-Business $Business `
-City $City

.\process-order.ps1

Write-Host "=== WEBSITE FACTORY FINISHED ==="
