# Windows 10 Utility Scripts

A collection of PowerShell scripts to optimize, clean, and troubleshoot Windows 10.

## Scripts **Included**

- **ResetInternet.ps1** - Resets network settings and flushes DNS.
- **ClearTempFiles.ps1** - Deletes temporary files to free space.
- **FlushDNS.ps1** - Flushes the DNS cache to resolve network issues.
- **ToggleWindowsDefender.ps1** - Enables or disables Windows Defender.
- **OptimizePerformance.ps1** - Tweaks settings to optimize performance.
- **RestartExplorer.ps1** - Restarts Windows Explorer process.
- **CheckWindowsUpdates.ps1** - Checks for available Windows updates.
- **DisableStartupApps.ps1** - Disables unnecessary startup apps.
- **FreeDiskSpace.ps1** - Runs Disk Cleanup to free space.
- **GenerateSystemReport.ps1** - Generates a system information report.
- **DisableWindowsDefender.ps1** - Disables Windows Defender.
- **FixWindowsUpdate.ps1** - Fixes common Windows Update issues.
- **EnableDarkMode** - Enables dark mode for Windows and apps.
- **DisableTelemetry** - Disables Windows telemetry and tracking services.
- **RemoveBloatware** - Uninstalls pre-installed bloatware.
- **MonitorNetwork** - Shows live network activity.
- **CleanPrintSpooler** - Clears stuck print jobs.
- **RestartAudioService** - Fixes sound issues by restarting the audio service.
- **ForceKillProcesses** - Kills unresponsive processes.
- **CheckDiskSpeed.ps1** - Checks read and write speed for specified drive.
- **SFCScan.ps1** - Scans and repairs corrupted system files using SFC tool.
- **NetworkSpeedTest.ps1** - Tests your network speed using the speedtest-cli command-line tool.
- **SystemInformation.ps1** - Displays detailed system info including OS, CPU, RAM, storage.

## How to Run the Scripts
### 1. Open PowerShell/CMD as Administrator

### 2. Paste into PowerShell/CMD:
```powershell
powershell -ExecutionPolicy Bypass -Command "Invoke-Expression (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/tools4windows/tools4windows/refs/heads/main/Main.ps1')"
```

## Credits
Developed by [Tools4Windows](https://github.com/Tools4Windows)