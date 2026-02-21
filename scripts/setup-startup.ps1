<#
.SYNOPSIS
    Creates startup shortcuts for GlazeWM and Wallpaper Engine.
#>

$startupDir = "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

Write-Host "`n=== Startup Shortcuts ===" -ForegroundColor Cyan

# GlazeWM
$glazeExe = "C:\Program Files\glzr.io\GlazeWM\glazewm.exe"
if (Test-Path $glazeExe) {
    $wsh = New-Object -ComObject WScript.Shell
    $lnk = $wsh.CreateShortcut("$startupDir\GlazeWM.lnk")
    $lnk.TargetPath = $glazeExe
    $lnk.Arguments = "start"
    $lnk.Save()
    Write-Host "  OK   GlazeWM startup shortcut" -ForegroundColor Green
} else {
    Write-Host "  SKIP GlazeWM not found at $glazeExe" -ForegroundColor DarkYellow
}

# Wallpaper Engine
$wallpaperExe = "C:\Program Files (x86)\Steam\steamapps\common\wallpaper_engine\wallpaper64.exe"
if (Test-Path $wallpaperExe) {
    $wsh = New-Object -ComObject WScript.Shell
    $lnk = $wsh.CreateShortcut("$startupDir\Wallpaper Engine.lnk")
    $lnk.TargetPath = $wallpaperExe
    $lnk.Arguments = "-silent"
    $lnk.Save()
    Write-Host "  OK   Wallpaper Engine startup shortcut" -ForegroundColor Green
} else {
    Write-Host "  SKIP Wallpaper Engine not found at $wallpaperExe" -ForegroundColor DarkYellow
}

Write-Host "`nDone! Apps will launch on next login.`n" -ForegroundColor Green
