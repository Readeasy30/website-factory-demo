Write-Host "WEBSITE FACTORY CONTROLLER ONLINE"

$pipeline = Get-Content .\controller\pipeline.json | ConvertFrom-Json

foreach ($step in $pipeline.pipeline) {
    Write-Host "READY:" $step
}
