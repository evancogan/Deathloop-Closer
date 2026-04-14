# Deathloop Closer

A simple PowerShell script to safely close the `Deathloop` process before sleep or shutdown.

## What it does

- Checks whether `Deathloop` is running
- Attempts to terminate the process
- Waits and verifies the process is fully closed
- Exits with clear status codes

## Requirements

- Windows
- PowerShell 5.1 or PowerShell 7+
- `Deathloop` process name available as `Deathloop`

## Usage

Run from PowerShell:

```powershell
.\Close-Deathloop.ps1
```

Or run by right-clicking and selecting **Run with PowerShell**.

## Exit codes

- `0`: Success (process closed)
- `1`: `Deathloop` was not running
- `2`: Failed to close process or timed out waiting

## Notes

The script uses forceful termination to ensure the game is closed:

- `Stop-Process -Force`

## Why?

This game has serious issues closing, at least on my pc. The process will hang, and it interrupts the sleep functionality of your PC, so this is a minimal way of cleaning up the game process tree before your computer tries to sleep and subsequently black-screens. Also recovers some memory stuck allocated to the game.

Use this only when you are okay with closing the game immediately.

Thanks for checking my project out! Happy Looping!
