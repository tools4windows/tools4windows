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

### DisableStartupApps.ps1
Write-Host "Disabling Unnecessary Startup Apps..." -ForegroundColor Cyan
Get-AppxPackage | Where-Object { $_.NonRemovable -eq $false } | Remove-AppxPackage
Write-Host "Startup Apps Disabled!" -ForegroundColor Green