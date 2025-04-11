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

### DisableWindowsDefender.ps1

# Ensure script is run with Administrator privileges
if (-NOT (Test-Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System")) {
    Write-Output "This script requires Administrator privileges. Please run PowerShell as Administrator."
    exit
}

# Disable Windows Defender via Registry
try {
    Write-Output "Disabling Windows Defender AntiSpyware..."
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value 1
    Write-Output "Windows Defender AntiSpyware has been disabled."
} catch {
    Write-Output "Error disabling Windows Defender AntiSpyware: $_"
}

# Disable Real-Time Protection (check if path exists and create if missing)
try {
    $realTimeProtectionPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection"
    if (-NOT (Test-Path $realTimeProtectionPath)) {
        Write-Output "Creating Real-Time Protection registry path..."
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "Real-Time Protection" -Force
    }
    Write-Output "Disabling Real-Time Protection..."
    Set-ItemProperty -Path $realTimeProtectionPath -Name "DisableRealtimeMonitoring" -Value 1
    Write-Output "Real-Time Protection has been disabled."
} catch {
    Write-Output "Error disabling Real-Time Protection: $_"
}

# Disable Cloud Protection (check if path exists and create if missing)
try {
    $cloudProtectionPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender\Spynet"
    if (-NOT (Test-Path $cloudProtectionPath)) {
        Write-Output "Creating Cloud Protection registry path..."
        New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name "Spynet" -Force
    }
    Write-Output "Disabling Cloud Protection..."
    Set-ItemProperty -Path $cloudProtectionPath -Name "SubmitSamplesConsent" -Value 2
    Write-Output "Cloud Protection has been disabled."
} catch {
    Write-Output "Error disabling Cloud Protection: $_"
}

# Disable Tamper Protection (manual step required)
Write-Output "Tamper Protection cannot be disabled via PowerShell. Please disable it manually in Windows Security settings."

# Stop Windows Defender services (ensure elevated permissions)
try {
    Write-Output "Stopping Windows Defender service..."
    Stop-Service -Name "WinDefend" -Force -ErrorAction Stop
    Write-Output "Windows Defender service stopped."
} catch {
    Write-Output "Error stopping Windows Defender service: $_"
}

# Set Windows Defender service to Disabled on startup
try {
    Write-Output "Disabling Windows Defender service startup..."
    Set-Service -Name "WinDefend" -StartupType Disabled -ErrorAction Stop
    Write-Output "Windows Defender service startup has been disabled."
} catch {
    Write-Output "Error disabling Windows Defender service startup: $_"
}

# Get all logical drives (excluding network drives)
try {
    $drives = Get-PSDrive -PSProvider FileSystem | Where-Object { $_.Root -match "^[A-Z]:\\" }

    # Loop through each drive and add it to Defender exclusions
    Write-Output "Adding exclusions for all local drives..."
    foreach ($drive in $drives) {
        $path = $drive.Root
        Add-MpPreference -ExclusionPath $path
        Write-Output "Added exclusion for: $path"
    }
    Write-Output "Exclusions have been set for all local drives."
} catch {
    Write-Output "Error adding exclusions for drives: $_"
}

Write-Output "Windows Defender has been successfully disabled. A restart may be required for full effect."