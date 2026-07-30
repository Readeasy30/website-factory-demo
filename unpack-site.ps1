$json = Get-Content ai-output.json -Raw | ConvertFrom-Json

$json."index.html" | Set-Content index.html -Encoding UTF8
$json."style.css"  | Set-Content style.css -Encoding UTF8
$json."script.js"  | Set-Content script.js -Encoding UTF8

Write-Host ""
Write-Host "FILES CREATED"
dir index.html,style.css,script.js
