<#
.SYNOPSIS
    Copies rice config files to their correct system locations.
#>

$repoRoot = Split-Path -Parent $PSScriptRoot
$configsDir = Join-Path $repoRoot "configs"

$configs = @(
    @{
        Name   = "PowerShell 7 profile"
        Source = "powershell\Microsoft.PowerShell_profile.ps1"
        Dest   = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
    },
    @{
        Name   = "PowerShell 5.1 profile"
        Source = "powershell\Microsoft.PowerShell_profile.ps1"
        Dest   = "$HOME\Documents\WindowsPowerShell\Microsoft.PowerShell_profile.ps1"
    },
    @{
        Name   = "Windows Terminal settings"
        Source = "windows-terminal\settings.json"
        Dest   = "$HOME\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json"
    },
    @{
        Name   = "GlazeWM config"
        Source = "glazewm\config.yaml"
        Dest   = "$HOME\.glzr\glazewm\config.yaml"
    },
    @{
        Name   = "Zebar styles"
        Source = "zebar\styles.css"
        Dest   = "$HOME\AppData\Roaming\zebar\downloads\glzr-io.starter@0.0.0\styles.css"
    },
    @{
        Name   = "Zebar widget"
        Source = "zebar\with-glazewm.html"
        Dest   = "$HOME\AppData\Roaming\zebar\downloads\glzr-io.starter@0.0.0\with-glazewm.html"
    },
    @{
        Name   = "btop4win config"
        Source = "btop\btop.conf"
        Dest   = "$HOME\AppData\Local\Microsoft\WinGet\Packages\aristocratos.btop4win_Microsoft.Winget.Source_8wekyb3d8bbwe\btop4win\btop.conf"
    },
    @{
        Name   = "Bash config"
        Source = "bash\.bashrc"
        Dest   = "$HOME\.bashrc"
    },
    @{
        Name   = "Claude Code settings"
        Source = "claude-code\settings.json"
        Dest   = "$HOME\.claude\settings.json"
    },
    @{
        Name   = "Neovim (LazyVim) config"
        Source = "nvim"
        Dest   = "$HOME\AppData\Local\nvim"
        IsDir  = $true
    }
)

Write-Host "`n=== Copying Config Files ===" -ForegroundColor Cyan

foreach ($cfg in $configs) {
    $src = Join-Path $configsDir $cfg.Source
    $dst = $cfg.Dest

    if (-not (Test-Path $src)) {
        Write-Host "  SKIP $($cfg.Name) - source not found" -ForegroundColor DarkYellow
        continue
    }

    if ($cfg.IsDir) {
        # Directory config: mirror the entire folder
        if (Test-Path $dst) { Remove-Item $dst -Recurse -Force }
        Copy-Item -Path $src -Destination $dst -Recurse -Force
    } else {
        # Single-file config
        $dstDir = Split-Path -Parent $dst
        if (-not (Test-Path $dstDir)) {
            New-Item -ItemType Directory -Path $dstDir -Force | Out-Null
        }
        Copy-Item -Path $src -Destination $dst -Force
    }
    Write-Host "  OK   $($cfg.Name)" -ForegroundColor Green
    Write-Host "       -> $dst" -ForegroundColor DarkGray
}

Write-Host "`nDone! Restart your terminal for changes to take effect.`n" -ForegroundColor Green
