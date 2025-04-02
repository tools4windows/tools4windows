# Parameters
param(
    [switch]$r
)

# Check for admin permissions
$AdminScriptURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/check-admin.ps1"
Invoke-Expression (New-Object Net.WebClient).DownloadString($AdminScriptURL)

### FreeDiskSpace.ps1
Write-Host "Freeing Up Disk Space..." -ForegroundColor Cyan
Cleanmgr /sagerun:1
Write-Host "Disk Cleanup Complete!" -ForegroundColor Green

# Credits Tools4Windows
if ($r) {
    $MainScriptURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/credits.ps1"
    Invoke-Expression (New-Object Net.WebClient).DownloadString($MainScriptURL)
}