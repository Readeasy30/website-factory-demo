param(
[string]$Business,
[string]$City
)

Write-Host "=== AUTONOMOUS WEBSITE FACTORY ==="

$order = @{
    Business = $Business
    City = $City
    Created = (Get-Date)
}

$order | ConvertTo-Json | Set-Content controller\active-order.json

Write-Host "1. Order Created"

.\build-website.ps1 `
-Business $Business `
-City $City

Write-Host "2. AI Site Generated"

.\unpack-site.ps1

Write-Host "3. Files Created"

git add .
git commit -m "automated customer website build"
git push

Write-Host "4. GitHub Updated"

wrangler pages deploy . `
--project-name website-factory-demo

Write-Host "5. Cloudflare Published"

Write-Host "=== COMPLETE ==="
