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
    @{ Name = "ResetInternet.ps1"; Description = "Resets network settings and flushes DNS." },
    @{ Name = "ClearTempFiles.ps1"; Description = "Deletes temporary files to free space." },
    @{ Name = "FlushDNS.ps1"; Description = "Flushes the DNS cache to resolve network issues." },
    @{ Name = "OptimizePerformance.ps1"; Description = "Tweaks settings to optimize performance." },
    @{ Name = "RestartExplorer.ps1"; Description = "Restarts Windows Explorer process." },
    @{ Name = "CheckWindowsUpdates.ps1"; Description = "Checks for available Windows updates." },
    @{ Name = "DisableStartupApps.ps1"; Description = "Disables unnecessary startup apps." },
    @{ Name = "FreeDiskSpace.ps1"; Description = "Runs Disk Cleanup to free space." },
    @{ Name = "GenerateSystemReport.ps1"; Description = "Generates a system information report." },
    @{ Name = "DisableWindowsDefender.ps1"; Description = "Disables Windows Defender." },
    @{ Name = "QuickCheckForViruses.ps1"; Description = "Performs a quick virus check on your machine." },
    @{ Name = "FixWindowsUpdate.ps1"; Description = "Fixes common Windows Update issues." },
    @{ Name = "EnableDarkMode.ps1"; Description = "Enables dark mode for Windows and apps." },
    @{ Name = "DisableTelemetry.ps1"; Description = "Disables Windows telemetry and tracking services." },
    @{ Name = "RemoveBloatware.ps1"; Description = "Uninstalls pre-installed bloatware." },
    @{ Name = "MonitorNetwork.ps1"; Description = "Shows live network activity." },
    @{ Name = "CleanPrintSpooler.ps1"; Description = "Clears stuck print jobs." },
    @{ Name = "RestartAudioService.ps1"; Description = "Fixes sound issues by restarting the audio service." },
    @{ Name = "ForceKillProcesses.ps1"; Description = "Kills unresponsive processes." },
    @{ Name = "CheckDiskSpeed.ps1"; Description = "Checks read and write speed for specified drive." },
    @{ Name = "SFCScan.ps1"; Description = "Scans and repairs corrupted system files using SFC tool." },
    @{ Name = "NetworkSpeedTest.ps1"; Description = "Tests your network speed using the speedtest-cli command-line tool." },
    @{ Name = "SystemInformation.ps1"; Description = "Displays detailed system info including OS, CPU, RAM, storage." }
)

# Add Index dynamically
$Scripts | ForEach-Object { $_ | Add-Member -MemberType NoteProperty -Name Index -Value ($Scripts.IndexOf($_) + 1) }

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