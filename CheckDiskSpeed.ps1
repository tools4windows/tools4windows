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

### CheckDiskSpeed.ps1
Write-Host "Enter the drive letter you want to check (e.g., C): " -ForegroundColor Yellow -NoNewline
$drive = Read-Host

# Validate input
if ($drive -match "^[a-zA-Z]$") {
    $drive = $drive.ToUpper()
    Write-Host "`nRunning speed test for drive $drive..." -ForegroundColor Cyan
    Write-Host "-------------------------------------------"

    # Run winsat and capture output
    $results = winsat disk -drive $drive 2>&1

    # Filter and display useful lines
    $results | Where-Object { $_ -match "Disk" -or $_ -match "Bytes/sec" -or $_ -match "Random" -or $_ -match "Sequential" } | ForEach-Object {
        Write-Host $_
    }

    Write-Host "-------------------------------------------"
} else {
    Write-Host "Invalid drive letter. Please enter a single alphabet letter (e.g., C, D, E)." -ForegroundColor Red
}