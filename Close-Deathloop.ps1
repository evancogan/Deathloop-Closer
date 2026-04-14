Write-Host "Deathloop Process Closer" -ForegroundColor Cyan
Write-Host "Made by Evan Cogan" -ForegroundColor DarkGray
Write-Host "GitHub: https://github.com/EvanCogan/Deathloop-Closer" -ForegroundColor DarkGray

Write-Host "Press Any Key To Continue..." -ForegroundColor Magenta
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

Write-Host "Checking if Deathloop is running..." -ForegroundColor Yellow
Start-Sleep -Seconds 1 # Small pause for better user experience

# Check if Deathloop is running at all
$process = Get-Process -Name "Deathloop" -ErrorAction SilentlyContinue
if (-not $process) {
    Write-Host "Deathloop was not running." -ForegroundColor Cyan
    Write-Host "Error Code: 1" -ForegroundColor Cyan

    Write-Host ""
    Write-Host "Window will close in 5 seconds..." -ForegroundColor DarkGray
    Start-Sleep -Seconds 5
    exit 1
}

# Try to stop the process tree
try {
    Stop-Process -Id $process.Id -Force -ErrorAction Stop
    Start-Sleep -Seconds 2 # Give it a moment to terminate
    Write-Host "Deathloop process termination requested..." -ForegroundColor Yellow
}
catch {
    Write-Host "ERROR: Unable to terminate Deathloop or one of its child processes." -ForegroundColor Red
    Write-Host "Details: $($_.Exception.Message)" -ForegroundColor Red
    Write-Host "Error Code: 2" -ForegroundColor Red

    Write-Host ""
    Write-Host "Window will close in 5 seconds..." -ForegroundColor DarkGray
    Start-Sleep -Seconds 5
    exit 2
}

# Verify the process is actually gone
Write-Host "Verifying Deathloop is closed..." -ForegroundColor Yellow

$timeout = 30
$elapsed = 0
$spinnerFrames = @('|', '/', '-', '\')

while (Get-Process -Name "Deathloop" -ErrorAction SilentlyContinue) {
    $spinnerFrame = $spinnerFrames[$elapsed % $spinnerFrames.Length]
    Write-Host -NoNewline "`rWaiting for Deathloop to exit... $spinnerFrame ($elapsed/$timeout s)"
    Start-Sleep -Seconds 1
    $elapsed++

    if ($elapsed -ge $timeout) {
        Write-Host ""
        Write-Host "ERROR: Deathloop is still running after $timeout seconds." -ForegroundColor Red
        Write-Host "Error Code: 2" -ForegroundColor Red

        Write-Host ""
        Write-Host "Window will close in 5 seconds..." -ForegroundColor DarkGray
        Start-Sleep -Seconds 5
        exit 2
    }
}

if ($elapsed -gt 0) {
    Write-Host "`r                                                        `r" -NoNewline
}

Write-Host "Deathloop is now fully closed." -ForegroundColor Green
Write-Host "You can safely sleep or shut down your PC." -ForegroundColor Green

Write-Host ""
Write-Host "Window will close in 5 seconds..." -ForegroundColor DarkGray
Start-Sleep -Seconds 5
exit 0
