# Parameters
param(
    [switch]$r
)

# Check for admin permissions
$AdminScriptURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/check-admin.ps1"
Invoke-Expression (New-Object Net.WebClient).DownloadString($AdminScriptURL)

### FixWindowsUpdate.ps1
$ServiceNames = @("wuauserv", "bits", "cryptsvc", "msiserver")
foreach ($service in $ServiceNames) {
    Write-Host "Stopping $service..." -ForegroundColor Yellow
    Stop-Service -Name $service -Force
    Write-Host "Starting $service..." -ForegroundColor Yellow
    Start-Service -Name $service
}
Write-Host "Windows Update services reset successfully!" -ForegroundColor Green

# Daily Cleanups Tools4Windows
if ($r) {
    $AddDailyCleanupsURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/add-daily-cleanups.ps1"
    Invoke-Expression (New-Object Net.WebClient).DownloadString($AddDailyCleanupsURL)
}