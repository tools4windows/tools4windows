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

### OptimizePerformance.ps1
Write-Host "Optimizing Windows Performance..." -ForegroundColor Cyan
powercfg -h off
bcdedit /set useplatformclock yes
bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes
Write-Host "Windows Performance Optimized! Restart may be required." -ForegroundColor Green