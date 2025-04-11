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

### NetworkSpeedTest.ps1
Write-Host "Testing network speed..." -ForegroundColor Cyan

# Check if speedtest-cli is installed
$testCommand = "speedtest-cli"
$testPath = Get-Command $testCommand -ErrorAction SilentlyContinue
if (!$testPath) {
    Write-Host "Speedtest-cli is not installed. Please install it first." -ForegroundColor Red
    return
}

# Run the network speed test
try {
    speedtest-cli --simple
} catch {
    Write-Host "There was an error running the network speed test." -ForegroundColor Red
}