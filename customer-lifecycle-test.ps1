param(
[string]$Business,
[string]$City
)

Write-Host "=== FULL CUSTOMER SIMULATION ==="

.\create-customer.ps1 `
-Business $Business `
-City $City

$customer = Get-ChildItem database\customers\*.json | Sort-Object LastWriteTime -Descending | Select-Object -First 1

.\create-website-record.ps1 `
-CustomerId $customer.BaseName

.\create-deployment-record.ps1 `
-WebsiteId $customer.BaseName

.\delivery-engine.ps1

Write-Host "CUSTOMER LIFECYCLE COMPLETE"
