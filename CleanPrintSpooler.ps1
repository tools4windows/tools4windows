# Parameters
param(
    [switch]$r
)

# Check for admin permissions
$AdminScriptURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/check-admin.ps1"
Invoke-Expression (New-Object Net.WebClient).DownloadString($AdminScriptURL)

### CleanPrintSpooler.ps1
Write-Host "Stopping the print spooler service..." -ForegroundColor Yellow
Stop-Service -Name "Spooler" -Force
Write-Host "Clearing stuck print jobs..." -ForegroundColor Yellow
Remove-Item -Path "C:\Windows\System32\spool\PRINTERS\*" -Force
Write-Host "Starting the print spooler service..." -ForegroundColor Yellow
Start-Service -Name "Spooler"
Write-Host "Print spooler cleaned!" -ForegroundColor Green

# Daily Cleanups Tools4Windows
if ($r) {
    $AddDailyCleanupsURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/add-daily-cleanups.ps1"
    Invoke-Expression (New-Object Net.WebClient).DownloadString($AddDailyCleanupsURL)
}