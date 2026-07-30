param(
[string]$Business,
[string]$City
)

Write-Host "=== PRODUCTION TEMPLATE ENGINE ==="

$template = @"
Business: $Business
Location: $City

Generate:
- Home page
- Services page
- About page
- Contact page

Style:
Professional local business website.
Mobile first.
Local SEO ready.
"@

$template | Set-Content controller\current-prompt.txt

Write-Host "PRODUCTION PROMPT READY"
