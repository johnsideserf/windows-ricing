# Oh My Posh
oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/JanDeDobbeleer/oh-my-posh/main/themes/1_shell.omp.json' | Invoke-Expression

# PSReadLine
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -Colors @{
    InlinePrediction = '#565f89'
    Command          = '#7aa2f7'
    Parameter        = '#bb9af7'
    String           = '#9ece6a'
    Variable         = '#e0af68'
    Number           = '#ff9e64'
    Operator         = '#7dcfff'
    Comment          = '#565f89'
    Error            = '#f7768e'
}

# Fix directory listing colors (PowerShell 7+ only)
if ($PSVersionTable.PSVersion.Major -ge 7) {
    $PSStyle.FileInfo.Directory = "`e[34;1m"
}

# Aliases & functions
Set-Alias -Name touch -Value New-Item
Set-Alias -Name ll -Value Get-ChildItem
function mkcd { param($dir) New-Item -ItemType Directory -Path $dir -Force | Out-Null; Set-Location $dir }
function which { param($cmd) (Get-Command $cmd -ErrorAction SilentlyContinue).Source }
function .. { Set-Location .. }
function ... { Set-Location ../.. }
