# Parameters
param(
    [switch]$r
)

# Check for admin permissions
$AdminScriptURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/check-admin.ps1"
Invoke-Expression (New-Object Net.WebClient).DownloadString($AdminScriptURL)

### OptimizePerformance.ps1
Write-Host "Optimizing Windows Performance..." -ForegroundColor Cyan
powercfg -h off
bcdedit /set useplatformclock yes
bcdedit /set disabledynamictick yes
bcdedit /set useplatformtick yes
Write-Host "Windows Performance Optimized! Restart may be required." -ForegroundColor Green

# Credits Tools4Windows
if ($r) {
    $MainScriptURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/credits.ps1"
    Invoke-Expression (New-Object Net.WebClient).DownloadString($MainScriptURL)
}