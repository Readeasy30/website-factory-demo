param(
[string]$Business,
[string]$City
)

Write-Host "=== STRIPE READY ORDER ENTRY ==="

$order = @{
    id = [guid]::NewGuid().ToString()
    business = $Business
    city = $City
    payment = "PAID"
    status = "READY_FOR_BUILD"
}

New-Item -ItemType Directory -Force controller\orders | Out-Null

$order | ConvertTo-Json | Set-Content "controller\orders\$($order.id).json"

Write-Host "PAID ORDER CREATED"
