Write-Host "=== SUPABASE SYNC WORKER ==="

$records = Get-ChildItem supabase\queue\*.json -ErrorAction SilentlyContinue

foreach ($record in $records) {

    $data = Get-Content $record.FullName | ConvertFrom-Json

    Write-Host ""
    Write-Host "SYNC READY:"
    Write-Host "Business:" $data.business
    Write-Host "City:" $data.city

    # Production step:
    # Insert record into Supabase table customers

    Remove-Item $record.FullName

    Write-Host "QUEUE RECORD PROCESSED"
}

Write-Host ""
Write-Host "SUPABASE SYNC WORKER ONLINE"
