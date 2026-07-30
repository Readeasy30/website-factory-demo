param(
[string]$WebsiteId
)

Write-Host "=== DEPLOYMENT RECORD CREATOR ==="

$website = Get-Content "database\websites\$WebsiteId.json" | ConvertFrom-Json

$deployment = @{
    website_id = $website.customer_id
    business = $website.business
    platform = "Cloudflare Pages"
    status = "READY"
    created = (Get-Date)
}

New-Item -ItemType Directory -Force database\deployments | Out-Null

$deployment | ConvertTo-Json | Set-Content "database\deployments\$WebsiteId.json"

Write-Host "DEPLOYMENT RECORD CREATED"
