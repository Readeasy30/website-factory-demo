param(
[string]$Business,
[string]$City
)

$job = @{
    id = [guid]::NewGuid().ToString()
    business = $Business
    city = $City
    status = "QUEUED"
    created = (Get-Date)
}

New-Item -ItemType Directory -Force controller\queue | Out-Null

$file = "controller\queue\$($job.id).json"

$job | ConvertTo-Json | Set-Content $file

Write-Host "JOB QUEUED:"
Write-Host $file
