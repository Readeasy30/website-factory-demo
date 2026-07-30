$order = Get-Content controller\order.json | ConvertFrom-Json

Write-Host "PROCESSING ORDER:"
Write-Host $order.Business
Write-Host $order.City

.\factory-run.ps1 `
-Business $order.Business `
-City $order.City

$order.Status = "COMPLETE"

$order | ConvertTo-Json | Set-Content controller\order.json

Write-Host "ORDER COMPLETE"
