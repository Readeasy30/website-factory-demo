Write-Host "=== ORDER PROCESSOR ONLINE ==="

$orders = Get-ChildItem controller\orders\*.json -ErrorAction SilentlyContinue

foreach ($orderFile in $orders) {

    $order = Get-Content $orderFile.FullName | ConvertFrom-Json

    Write-Host "Building:" $order.business

    .\one-button-factory.ps1 `
    -Business $order.business `
    -City $order.city

    Remove-Item $orderFile.FullName

    Write-Host "ORDER COMPLETE"
}

Write-Host "NO PENDING ORDERS"
