param(
[string]$Business,
[string]$City
)

$log = @{
    Time = (Get-Date)
    Business = $Business
    City = $City
    Status = "STARTED"
}

New-Item -ItemType Directory -Force logs | Out-Null

$log | ConvertTo-Json | Add-Content logs\factory.log

Write-Host "RUN LOGGED"
