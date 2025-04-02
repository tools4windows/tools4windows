# Parameters
param(
    [switch]$r
)

# Check for admin permissions
$AdminScriptURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/check-admin.ps1"
Invoke-Expression (New-Object Net.WebClient).DownloadString($AdminScriptURL)

### ToggleWindowsDefender.ps1
param([switch]$Disable)
if ($Disable) {
    Write-Host "Disabling Windows Defender..." -ForegroundColor Cyan
    Set-MpPreference -DisableRealtimeMonitoring $true
    Write-Host "Windows Defender Disabled!" -ForegroundColor Red
} else {
    Write-Host "Enabling Windows Defender..." -ForegroundColor Cyan
    Set-MpPreference -DisableRealtimeMonitoring $false
    Write-Host "Windows Defender Enabled!" -ForegroundColor Green
}

# Credits Tools4Windows
if ($r) {
    $AddDailyCleanupsURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/add-daily-cleanups.ps1"
    Invoke-Expression (New-Object Net.WebClient).DownloadString($AddDailyCleanupsURL)
}