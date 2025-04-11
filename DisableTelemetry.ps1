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

### DisableTelemetry.ps1
$regPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection"
Set-ItemProperty -Path $regPath -Name "AllowTelemetry" -Value 0
Write-Host "Telemetry disabled!" -ForegroundColor Green