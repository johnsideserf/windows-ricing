<#
.SYNOPSIS
    Applies Windows registry tweaks: dark mode, accent color, hide desktop icons.
#>

Write-Host "`n=== Windows Registry Tweaks ===" -ForegroundColor Cyan

# Dark mode (apps + system)
Write-Host "Enabling dark mode..." -ForegroundColor Yellow
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'AppsUseLightTheme' -Value 0
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize' -Name 'SystemUsesLightTheme' -Value 0
Write-Host "  OK" -ForegroundColor Green

# Accent color (Tokyo Night blue #7aa2f7, stored as BGR 0x00f7a27a)
Write-Host "Setting accent color to Tokyo Night blue..." -ForegroundColor Yellow
$accentBGR = 0x00f7a27a
$colorizationARGB = 0xc47aa2f7

$dwmPath = 'HKCU:\Software\Microsoft\Windows\DWM'
Set-ItemProperty -Path $dwmPath -Name 'AccentColor' -Value $accentBGR -Type DWord
Set-ItemProperty -Path $dwmPath -Name 'ColorizationColor' -Value $colorizationARGB -Type DWord

$accentPath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent'
Set-ItemProperty -Path $accentPath -Name 'AccentColorMenu' -Value $accentBGR -Type DWord
Set-ItemProperty -Path $accentPath -Name 'StartColorMenu' -Value $accentBGR -Type DWord
Write-Host "  OK" -ForegroundColor Green

# Hide desktop icons
Write-Host "Hiding desktop icons..." -ForegroundColor Yellow
Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'HideIcons' -Value 1
Write-Host "  OK" -ForegroundColor Green

# Hide recycle bin from desktop
Write-Host "Hiding recycle bin icon..." -ForegroundColor Yellow
$recyclePath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel'
if (-not (Test-Path $recyclePath)) {
    New-Item -Path $recyclePath -Force | Out-Null
}
# Recycle Bin CLSID
Set-ItemProperty -Path $recyclePath -Name '{645FF040-5081-101B-9F08-00AA002F954E}' -Value 1 -Type DWord
Write-Host "  OK" -ForegroundColor Green

# Restart Explorer to apply
Write-Host "Restarting Explorer..." -ForegroundColor Yellow
Stop-Process -Name explorer -Force -ErrorAction SilentlyContinue
Start-Sleep -Seconds 1
Start-Process explorer
Write-Host "  OK" -ForegroundColor Green

Write-Host "`nDone! Registry tweaks applied.`n" -ForegroundColor Green
