# Parameters
param(
    [switch]$runCleanup
)

# Check for admin permissions
$AdminScriptURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/check-admin.ps1"
Invoke-Expression (New-Object Net.WebClient).DownloadString($AdminScriptURL)

# Daily Cleanups Tools4Windows
if ($runCleanup) {
    $AddDailyCleanupsURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/add-daily-cleanups.ps1"
    Invoke-Expression (New-Object Net.WebClient).DownloadString($AddDailyCleanupsURL)
}

### GenerateSystemReport.ps1
Write-Host "Generating System Report..." -ForegroundColor Cyan
systeminfo | Out-File -FilePath $env:USERPROFILE\Desktop\SystemReport.txt
Write-Host "System Report Saved to Desktop!" -ForegroundColor Green