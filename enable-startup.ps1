$taskName = "WebsiteFactoryWatchdog"

$action = New-ScheduledTaskAction `
-Execute "powershell.exe" `
-Argument "-ExecutionPolicy Bypass -File C:\Users\Wholelychit\website-factory\factory-watchdog.ps1"

$trigger = New-ScheduledTaskTrigger `
-AtStartup

Register-ScheduledTask `
-TaskName $taskName `
-Action $action `
-Trigger $trigger `
-Force

Write-Host "WINDOWS STARTUP AUTOMATION ENABLED"
