param(
[string]$Business,
[string]$City
)

$customer = @{
    id = [guid]::NewGuid().ToString()
    business = $Business
    city = $City
    created = (Get-Date)
    status = "ACTIVE"
}

New-Item -ItemType Directory -Force database\customers | Out-Null

$customer | ConvertTo-Json | Set-Content "database\customers\$($customer.id).json"

Write-Host "CUSTOMER RECORD CREATED"
