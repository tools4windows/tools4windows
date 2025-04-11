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

### SFCScan.ps1
Write-Host "Starting System File Checker (SFC) scan..." -ForegroundColor Cyan
Write-Host "This may take some time depending on your system." -ForegroundColor Yellow

# Run the SFC scan
try {
    sfc /scannow
    Write-Host "SFC scan completed successfully!" -ForegroundColor Green
} catch {
    Write-Host "There was an error running the SFC scan." -ForegroundColor Red
}