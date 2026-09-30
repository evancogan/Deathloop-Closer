# Deathloop Closer

> **Work in progress.** Check back later for more.

A PowerShell script that force-closes `Deathloop` before sleep or shutdown.

## Usage

```powershell
.\Close-Deathloop.ps1
```

Or right-click, **Run with PowerShell**. Needs Windows and PowerShell 5.1 or 7+.

## Exit codes

- `0`: closed
- `1`: `Deathloop` wasn't running
- `2`: failed to close or timed out

## Why?

This game has serious issues closing, at least on my pc. The process will hang, and it interrupts the sleep functionality of your PC, so this is a minimal way of cleaning up the game process tree before your computer tries to sleep and subsequently black-screens. Also recovers some memory stuck allocated to the game.

Use this only when you are okay with closing the game immediately.

Thanks for checking my project out! Happy Looping!
