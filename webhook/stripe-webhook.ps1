param(
[string]$Business,
[string]$City
)

$order = @{
    id = [guid]::NewGuid().ToString()
    business = $Business
    city = $City
    payment = "stripe_paid"
    status = "queued"
}

New-Item -ItemType Directory -Force controller\orders | Out-Null

$order | ConvertTo-Json | Set-Content "controller\orders\$($order.id).json"

Write-Host "STRIPE WEBHOOK SIMULATION COMPLETE"
