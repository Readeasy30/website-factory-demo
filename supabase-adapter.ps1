param(
[string]$Business,
[string]$City
)

Write-Host "=== SUPABASE ADAPTER PREP ==="

$record = @{
    business = $Business
    city = $City
    source = "website-factory"
    created = (Get-Date)
}

New-Item -ItemType Directory -Force supabase\queue | Out-Null

$record | ConvertTo-Json | Set-Content "supabase\queue\$([guid]::NewGuid()).json"

Write-Host "READY FOR SUPABASE INSERT"
