param(
[string]$Business,
[string]$City
)

Write-Host "WEBHOOK RECEIVED"

.\receive-order.ps1 `
-Business $Business `
-City $City

.\process-order.ps1
