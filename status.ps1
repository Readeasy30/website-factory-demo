Write-Host "================================"
Write-Host " WEBSITE FACTORY AUTOMATION"
Write-Host "================================"

$order = Get-Content controller\order.json | ConvertFrom-Json

Write-Host "Business:" $order.Business
Write-Host "City:" $order.City
Write-Host "Status:" $order.Status

Write-Host ""
Write-Host "Pipeline:"
Write-Host "1. AI Generation      READY"
Write-Host "2. File Creation      READY"
Write-Host "3. GitHub Push        READY"
Write-Host "4. Cloudflare Deploy  READY"
Write-Host "5. Customer Delivery  NEXT"

Write-Host ""
Write-Host "AUTOMATION CONTROLLER ONLINE"
