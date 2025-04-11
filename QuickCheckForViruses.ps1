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

### QuickCheckForViruses.ps1
Write-Host "Starting Tools4Windows Virus Scan..." -ForegroundColor Cyan
Write-Host "--------------------------------------------------"

# Check if Windows Defender is installed
if (-not (Get-Command Start-MpScan -ErrorAction SilentlyContinue)) {
    Write-Host "Windows Defender is not installed or accessible!" -ForegroundColor Red
    exit
}

Write-Host "Scanning system for potential threats..." -ForegroundColor Yellow

# Perform a quick scan
Start-MpScan -ScanType QuickScan
Write-Host "Quick scan initiated. This may take some time..." -ForegroundColor Yellow

# Check scan results
$Threats = Get-MpThreatDetection
if ($Threats) {
    Write-Host "Threats found!" -ForegroundColor Red
    $Threats | ForEach-Object {
        Write-Host "---------------------------------"
        Write-Host "Threat Name: $($_.ThreatName)" -ForegroundColor White
        Write-Host "Severity: $($_.Severity)" -ForegroundColor Yellow
        Write-Host "Category: $($_.ThreatCategory)" -ForegroundColor Green
        Write-Host "---------------------------------"
    }
    Write-Host "Consider taking action to remove threats." -ForegroundColor Red
} else {
    Write-Host "No threats found. Your system is clean!" -ForegroundColor Green
}

Write-Host "Virus scan complete." -ForegroundColor Cyan