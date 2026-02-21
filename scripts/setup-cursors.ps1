<#
.SYNOPSIS
    Downloads and installs the Bibata Modern Classic cursor theme.
#>

$cursorVersion = "v2.0.7"
$downloadUrl = "https://github.com/ful1e5/Bibata_Cursor/releases/download/$cursorVersion/Bibata-Modern-Classic-Windows.zip"
$installDir = "$HOME\Pictures\rice\bibata"
$cursorDir = "$installDir\Bibata-Modern-Classic-Regular-Windows"
$tempZip = "$env:TEMP\Bibata-Modern-Classic-Windows.zip"

Write-Host "`n=== Bibata Cursor Installer ===" -ForegroundColor Cyan

# Download
Write-Host "Downloading Bibata Modern Classic $cursorVersion..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $downloadUrl -OutFile $tempZip -UseBasicParsing
Write-Host "  Downloaded to $tempZip" -ForegroundColor DarkGray

# Extract
Write-Host "Extracting..." -ForegroundColor Yellow
if (-not (Test-Path $installDir)) {
    New-Item -ItemType Directory -Path $installDir -Force | Out-Null
}
Expand-Archive -Path $tempZip -DestinationPath $installDir -Force
Remove-Item $tempZip -Force
Write-Host "  Extracted to $installDir" -ForegroundColor DarkGray

# Apply via registry
Write-Host "Applying cursor via registry..." -ForegroundColor Yellow

$regPath = "HKCU:\Control Panel\Cursors"
$cursors = @{
    ""              = "Bibata-Modern-Classic"
    "Arrow"         = "$cursorDir\Pointer.cur"
    "Help"          = "$cursorDir\Help.cur"
    "AppStarting"   = "$cursorDir\Work.ani"
    "Wait"          = "$cursorDir\Busy.ani"
    "Crosshair"     = "$cursorDir\Cross.cur"
    "IBeam"         = "$cursorDir\Text.cur"
    "NWPen"         = "$cursorDir\Handwriting.cur"
    "No"            = "$cursorDir\Unavailable.cur"
    "SizeNS"        = "$cursorDir\Vert.cur"
    "SizeWE"        = "$cursorDir\Horz.cur"
    "SizeNWSE"      = "$cursorDir\Dgn1.cur"
    "SizeNESW"      = "$cursorDir\Dgn2.cur"
    "SizeAll"       = "$cursorDir\Move.cur"
    "Hand"          = "$cursorDir\Link.cur"
    "UpArrow"       = "$cursorDir\Alternate.cur"
    "Pin"           = "$cursorDir\Pin.cur"
    "Person"        = "$cursorDir\Person.cur"
}

foreach ($key in $cursors.Keys) {
    Set-ItemProperty -Path $regPath -Name $key -Value $cursors[$key]
}

# Refresh cursors via SystemParametersInfo
Add-Type -TypeDefinition @"
using System;
using System.Runtime.InteropServices;
public class CursorRefresh {
    [DllImport("user32.dll", SetLastError = true)]
    public static extern bool SystemParametersInfo(uint uiAction, uint uiParam, IntPtr pvParam, uint fWinIni);
}
"@
[CursorRefresh]::SystemParametersInfo(0x0057, 0, [IntPtr]::Zero, 0x0003) | Out-Null

Write-Host "`nDone! Bibata Modern Classic cursor is now active.`n" -ForegroundColor Green
