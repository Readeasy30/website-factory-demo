param(
[string]$Business,
[string]$City
)

Write-Host "STARTING WEBSITE FACTORY"

.\build-website.ps1 -Business $Business -City $City

.\unpack-site.ps1

git add .

git commit -m "AI generated website update"

git push

wrangler pages deploy . --project-name website-factory-demo

Write-Host "WEBSITE FACTORY COMPLETE"
