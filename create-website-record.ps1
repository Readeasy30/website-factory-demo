param(
[string]$CustomerId
)

Write-Host "=== CUSTOMER WEBSITE LINKER ==="

$customer = Get-Content "database\customers\$CustomerId.json" | ConvertFrom-Json

$website = @{
    customer_id = $customer.id
    business = $customer.business
    city = $customer.city
    deployment = "pending"
    status = "READY_FOR_BUILD"
}

New-Item -ItemType Directory -Force database\websites | Out-Null

$website | ConvertTo-Json | Set-Content "database\websites\$CustomerId.json"

Write-Host "WEBSITE RECORD CREATED"
