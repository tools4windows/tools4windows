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

### SystemInformation.ps1
Write-Host "Collecting system information..." -ForegroundColor Cyan

# Get OS information
$os = Get-CimInstance Win32_OperatingSystem
Write-Host "`nOS Information:" -ForegroundColor Green
Write-Host "Name: $($os.Caption)"
Write-Host "Version: $($os.Version)"
Write-Host "Architecture: $($os.OSArchitecture)"
Write-Host "Build Number: $($os.BuildNumber)"
Write-Host "Last Boot Time: $($os.LastBootUpTime)"

# Get CPU information
$cpu = Get-CimInstance Win32_Processor
Write-Host "`nCPU Information:" -ForegroundColor Green
Write-Host "Name: $($cpu.Name)"
Write-Host "Cores: $($cpu.NumberOfCores)"
Write-Host "Logical Processors: $($cpu.NumberOfLogicalProcessors)"
Write-Host "Max Clock Speed: $($cpu.MaxClockSpeed) MHz"

# Get RAM information
$ram = Get-CimInstance Win32_PhysicalMemory
$totalRam = [math]::round($ram.Capacity / 1GB, 2)
Write-Host "`nRAM Information:" -ForegroundColor Green
Write-Host "Total RAM: $totalRam GB"

# Get storage information
$disks = Get-CimInstance Win32_LogicalDisk -Filter "DriveType=3"
Write-Host "`nStorage Information:" -ForegroundColor Green
foreach ($disk in $disks) {
    $size = [math]::round($disk.Size / 1GB, 2)
    $freeSpace = [math]::round($disk.FreeSpace / 1GB, 2)
    Write-Host "Drive $($disk.DeviceID): $size GB Total, $freeSpace GB Free"
}

# Get GPU information
$gpu = Get-CimInstance Win32_VideoController
Write-Host "`nGPU Information:" -ForegroundColor Green
Write-Host "Name: $($gpu.Name)"
Write-Host "Memory Size: $([math]::round($gpu.AdapterRAM / 1MB, 2)) MB"

# Get network adapter information
$network = Get-CimInstance Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true }
Write-Host "`nNetwork Information:" -ForegroundColor Green
foreach ($nic in $network) {
    Write-Host "Adapter: $($nic.Description)"
    Write-Host "IP Address: $($nic.IPAddress[0])"
}

# Get System Uptime
$uptime = (Get-Date) - $os.LastBootUpTime
Write-Host "`nSystem Uptime:" -ForegroundColor Green
Write-Host "$($uptime.Days) days, $($uptime.Hours) hours, $($uptime.Minutes) minutes"