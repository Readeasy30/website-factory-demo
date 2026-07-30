param(
[string]$Business,
[string]$City
)

Write-Host "=== CUSTOMER ORDER AUTOMATION ==="

.\receive-order.ps1 `
-Business $Business `
-City $City

Write-Host "ORDER QUEUED"

.\process-order.ps1

Write-Host "DELIVERY PIPELINE COMPLETE"
