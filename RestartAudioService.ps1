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

### RestartAudioService.ps1
Write-Host "Stopping Windows Audio service..." -ForegroundColor Yellow
Stop-Service -Name "Audiosrv" -Force
Write-Host "Starting Windows Audio service..." -ForegroundColor Yellow
Start-Service -Name "Audiosrv"
Write-Host "Audio service restarted!" -ForegroundColor Green