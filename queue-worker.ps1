Write-Host "=== QUEUE PROCESSOR ONLINE ==="

$jobs = Get-ChildItem controller\queue\*.json

foreach ($job in $jobs) {

    $order = Get-Content $job.FullName | ConvertFrom-Json

    Write-Host ""
    Write-Host "PROCESSING:" $order.business

    .\autonomous-factory.ps1 `
    -Business $order.business `
    -City $order.city

    Remove-Item $job.FullName

    Write-Host "JOB COMPLETE"
}

Write-Host "QUEUE EMPTY"
