param(
    [string]$Business = "Sample Local Business",
    [string]$City = "Springfield, MO"
)

$Prompt = @"
Create a complete production-ready local business website.

Business: $Business
City: $City

Return exactly one JSON object.

Schema:
{
  "index.html":"...",
  "style.css":"...",
  "script.js":"..."
}
"@

$Body = @{
    model = "auto/best-fast"
    stream = $false
    messages = @(
        @{
            role = "user"
            content = $Prompt
        }
    )
} | ConvertTo-Json -Depth 10

$r = Invoke-RestMethod `
    -Uri "http://localhost:20128/v1/chat/completions" `
    -Method POST `
    -ContentType "application/json" `
    -Body $Body

$content = $r.choices[0].message.content

$content | Set-Content ai-output.json -Encoding UTF8

Write-Host "AI generation complete."
