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

### ForceKillProcesses.ps1
Write-Host "Listing running processes..." -ForegroundColor Yellow
$Processes = Get-Process | Where-Object { $_.Responding -eq $false }
foreach ($process in $Processes) {
    Write-Host "Killing unresponsive process: $($process.Name)" -ForegroundColor Red
    Stop-Process -Name $process.Name -Force
}
Write-Host "Unresponsive processes terminated!" -ForegroundColor Green