# Parameters
param(
    [switch]$r
)

# Check for admin permissions
$AdminScriptURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/check-admin.ps1"
Invoke-Expression (New-Object Net.WebClient).DownloadString($AdminScriptURL)

### CheckWindowsUpdates.ps1
Write-Host "Checking for Windows Updates..." -ForegroundColor Cyan
Get-WindowsUpdate
Write-Host "Updates Checked!" -ForegroundColor Green

# Credits Tools4Windows
if ($r) {
    $MainScriptURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/credits.ps1"
    Invoke-Expression (New-Object Net.WebClient).DownloadString($MainScriptURL)
}