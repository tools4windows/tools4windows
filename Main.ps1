### Main.ps1
Write-Host "Windows 10 Utility Scripts" -ForegroundColor Cyan
Write-Host "---------------------------------"

$Scripts = @(
    @{ Name = "ResetInternet.ps1"; Description = "Resets network settings and flushes DNS." },
    @{ Name = "ClearTempFiles.ps1"; Description = "Deletes temporary files to free space." },
    @{ Name = "FlushDNS.ps1"; Description = "Flushes the DNS cache to resolve network issues." },
    @{ Name = "ToggleWindowsDefender.ps1"; Description = "Enables or disables Windows Defender." },
    @{ Name = "OptimizePerformance.ps1"; Description = "Tweaks settings to optimize performance." },
    @{ Name = "RestartExplorer.ps1"; Description = "Restarts Windows Explorer process." },
    @{ Name = "CheckWindowsUpdates.ps1"; Description = "Checks for available Windows updates." },
    @{ Name = "DisableStartupApps.ps1"; Description = "Disables unnecessary startup apps." },
    @{ Name = "FreeDiskSpace.ps1"; Description = "Runs Disk Cleanup to free space." },
    @{ Name = "GenerateSystemReport.ps1"; Description = "Generates a system information report." }
)

foreach ($script in $Scripts) {
    Write-Host "$($script.Name) - $($script.Description)"
}

Write-Host "---------------------------------"
Write-Host "Credits: Tools4Windows - https://github.com/Tools4Windows" -ForegroundColor Green
