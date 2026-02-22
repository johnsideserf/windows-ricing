#Requires -RunAsAdministrator
<#
.SYNOPSIS
    Installs all apps for the Windows rice setup via winget.
#>

$apps = @(
    "glzr-io.glazewm"
    "JanDeDobbeleer.OhMyPosh"
    "Microsoft.PowerShell"
    "Microsoft.WindowsTerminal"
    "aristocratos.btop4win"
    "RamenSoftware.Windhawk"
    "FilesCommunity.Files"
    "GitHub.cli"
    "Neovim.Neovim"
    "ajeetdsouza.zoxide"
    "junegunn.fzf"
    "eza-community.eza"
    "LibreHardwareMonitor.LibreHardwareMonitor"

    "JesseDuffield.lazygit"
    "BurntSushi.ripgrep.MSVC"
    "dandavison.delta"
)

Write-Host "`n=== Windows Rice Installer ===" -ForegroundColor Cyan
Write-Host "Installing $($apps.Count) packages via winget...`n"

foreach ($app in $apps) {
    Write-Host "Installing $app..." -ForegroundColor Yellow
    winget install $app --accept-source-agreements --accept-package-agreements --silent
    if ($LASTEXITCODE -eq 0) {
        Write-Host "  OK" -ForegroundColor Green
    } else {
        Write-Host "  Already installed or failed (exit code $LASTEXITCODE)" -ForegroundColor DarkYellow
    }
}

Write-Host "`n=== Manual installs required ===" -ForegroundColor Cyan
Write-Host "  - JetBrainsMono Nerd Font: https://www.nerdfonts.com/font-downloads"
Write-Host "  - Wallpaper Engine: Install from Steam"
Write-Host "  - PowerToys: winget install Microsoft.PowerToys (optional)`n"

Write-Host "Done! Run the setup scripts next:" -ForegroundColor Green
Write-Host "  .\setup-configs.ps1   - Copy config files"
Write-Host "  .\setup-cursors.ps1   - Install Bibata cursor"
Write-Host "  .\setup-startup.ps1   - Create startup shortcuts"
Write-Host "  .\setup-windows.ps1   - Apply registry tweaks`n"
