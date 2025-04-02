# Parameters
param(
    [switch]$r
)

# Check for admin permissions
$AdminScriptURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/check-admin.ps1"
Invoke-Expression (New-Object Net.WebClient).DownloadString($AdminScriptURL)

# Daily Cleanups Tools4Windows
if ($r) {
    $AddDailyCleanupsURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/add-daily-cleanups.ps1"
    Invoke-Expression (New-Object Net.WebClient).DownloadString($AddDailyCleanupsURL)
}

### RemoveBloatware.ps1
$apps = @("Microsoft.XboxApp", "Microsoft.3DViewer", "Microsoft.MicrosoftEdge", "Microsoft.Office.OneNote", "Microsoft.People", "Microsoft.WindowsAlarms", "Microsoft.WindowsCamera")
foreach ($app in $apps) {
    Write-Host "Removing $app..." -ForegroundColor Yellow
    Get-AppxPackage $app | Remove-AppxPackage
}
Write-Host "Bloatware removed!" -ForegroundColor Green