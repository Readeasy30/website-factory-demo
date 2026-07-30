param(
[string]$Business,
[string]$City
)

$order = @{
    Business = $Business
    City = $City
    Time = (Get-Date).ToString()
    Status = "NEW"
}

$order | ConvertTo-Json | Set-Content controller\order.json

Write-Host "ORDER RECEIVED"
Get-Content controller\order.json
