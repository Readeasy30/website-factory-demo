param(
[string]$Business,
[string]$City
)

Write-Host "=== FACTORY PRODUCTION RUN ==="

.\template-engine.ps1 `
-Business $Business `
-City $City

.\build-website.ps1 `
-Business $Business `
-City $City

.\unpack-site.ps1

git add .
git commit -m "production website build"
git push

wrangler pages deploy . `
--project-name website-factory-demo

Write-Host "PRODUCTION BUILD COMPLETE"
