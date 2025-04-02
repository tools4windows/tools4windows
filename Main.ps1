# Parameters
param(
    [switch]$r
)

# Daily Cleanups Tools4Windows
if ($r) {
    $AddDailyCleanupsURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/add-daily-cleanups.ps1"
    Invoke-Expression (New-Object Net.WebClient).DownloadString($AddDailyCleanupsURL)
}

# Check for admin permissions
$AdminScriptURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/check-admin.ps1"
Invoke-Expression (New-Object Net.WebClient).DownloadString($AdminScriptURL)

### Main.ps1
Write-Host "Windows 10 Utility Scripts" -ForegroundColor Cyan
Write-Host "---------------------------------"

$Scripts = @(
    @{ Index = 1; Name = "ResetInternet.ps1"; Description = "Resets network settings and flushes DNS." },
    @{ Index = 2; Name = "ClearTempFiles.ps1"; Description = "Deletes temporary files to free space." },
    @{ Index = 3; Name = "FlushDNS.ps1"; Description = "Flushes the DNS cache to resolve network issues." },
    @{ Index = 4; Name = "ToggleWindowsDefender.ps1"; Description = "Enables or disables Windows Defender." },
    @{ Index = 5; Name = "OptimizePerformance.ps1"; Description = "Tweaks settings to optimize performance." },
    @{ Index = 6; Name = "RestartExplorer.ps1"; Description = "Restarts Windows Explorer process." },
    @{ Index = 7; Name = "CheckWindowsUpdates.ps1"; Description = "Checks for available Windows updates." },
    @{ Index = 8; Name = "DisableStartupApps.ps1"; Description = "Disables unnecessary startup apps." },
    @{ Index = 9; Name = "FreeDiskSpace.ps1"; Description = "Runs Disk Cleanup to free space." },
    @{ Index = 10; Name = "GenerateSystemReport.ps1"; Description = "Generates a system information report." },
    @{ Index = 11; Name = "DisableWindowsDefender.ps1"; Description = "Disables Windows Defender." },
    @{ Index = 12; Name = "QuickCheckForViruses.ps1"; Description = "Performs a quick virus check on your machine." }
)

foreach ($script in $Scripts) {
    Write-Host "$($script.Index). $($script.Name) - $($script.Description)"
}

Write-Host "---------------------------------"
Write-Host "Enter the number of the script you want to run: " -ForegroundColor Yellow -NoNewline
$choice = Read-Host

$selectedScript = $Scripts | Where-Object { $_.Index -eq [int]$choice }
if ($selectedScript) {
    $ScriptURL = "https://raw.githubusercontent.com/tools4windows/tools4windows/refs/heads/main/$($selectedScript.Name)"
    Write-Host "Running $($selectedScript.Name)..." -ForegroundColor Cyan
    Invoke-Expression (New-Object Net.WebClient).DownloadString($ScriptURL)
} else {
    Write-Host "Invalid selection. Exiting..." -ForegroundColor Red
}

Write-Host "---------------------------------"
Write-Host "Credits: Tools4Windows - https://github.com/Tools4Windows" -ForegroundColor Green
