param(
[string]$Business,
[string]$City
)

$site = "$Business - $City"

Write-Host "QUEUE: $site"

.\build-website.ps1 `
-Business $Business `
-City $City

.\unpack-site.ps1

git add .

git commit -m "automated build: $site"

git push

wrangler pages deploy . `
--project-name website-factory-demo

Write-Host "LIVE: $site"
