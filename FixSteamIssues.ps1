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

### FixSteamIssues.ps1
# Coming soon..
Write-Host "Trying method 1..." -ForegroundColor Cyan
Write-Host "Done!" -ForegroundColor Cyan
Write-Host "Trying method 2..." -ForegroundColor Cyan
Write-Host "Done!" -ForegroundColor Cyan
Write-Host "Trying method 3..." -ForegroundColor Cyan
Write-Host "Done!" -ForegroundColor Cyan