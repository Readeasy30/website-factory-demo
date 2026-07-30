Write-Host "=== FINAL AUTOMATION LOOP TEST ==="

.\stripe-order-simulator.ps1 `
-Business "Autonomous Test Company" `
-City "Hillsboro MO"

Start-Sleep -Seconds 2

.\order-worker.ps1

Write-Host ""
Write-Host "AUTOMATED ORDER PIPELINE TEST COMPLETE"
