# Parameters
param(
    [switch]$r
)

# Check for admin permissions
$AdminScriptURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/check-admin.ps1"
Invoke-Expression (New-Object Net.WebClient).DownloadString($AdminScriptURL)

# Daily Cleanups Tools4Windows
if ($r) {
    $AddDailyCleanupsURL = "https://raw.githubusercontent.com/tools4windows/other/refs/heads/main/add-daily-cleanups.ps1"
    Invoke-Expression (New-Object Net.WebClient).DownloadString($AddDailyCleanupsURL)
}

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
    @{ Index = 13; Name = "FixWindowsUpdate.ps1"; Description = "Fixes common Windows Update issues." },
    @{ Index = 14; Name = "EnableDarkMode.ps1"; Description = "Enables dark mode for Windows and apps." },
    @{ Index = 15; Name = "DisableTelemetry.ps1"; Description = "Disables Windows telemetry and tracking services." },
    @{ Index = 16; Name = "RemoveBloatware.ps1"; Description = "Uninstalls pre-installed bloatware." },
    @{ Index = 17; Name = "MonitorNetwork.ps1"; Description = "Shows live network activity." },
    @{ Index = 18; Name = "CleanPrintSpooler.ps1"; Description = "Clears stuck print jobs." },
    @{ Index = 19; Name = "RestartAudioService.ps1"; Description = "Fixes sound issues by restarting the audio service." },
    @{ Index = 20; Name = "ForceKillProcesses.ps1"; Description = "Kills unresponsive processes." },
    @{ Index = 21; Name = "CheckDiskSpeed.ps1"; Description = "Checks read and write speed for specified drive." },
    @{ Index = 22; Name = "SFCScan.ps1"; Description = "Scans and repairs corrupted system files using SFC tool." },
    @{ Index = 23; Name = "NetworkSpeedTest.ps1"; Description = "Tests your network speed using the speedtest-cli command-line tool." },
    @{ Index = 24; Name = "SystemInformation.ps1"; Description = "Displays detailed system info including OS, CPU, RAM, storage." }
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