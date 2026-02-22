<p align="center">
  <img src="warhammer-transparent-20.png" alt="Logo" width="200">
</p>

# Windows Rice

Tokyo Night Storm themed Windows 11 desktop setup with tiling window management, a custom status bar, and a fully scripted install.

![Tiled workspace with terminal, browser, and code editor](screenshot.png)
![Clean desktop with Zebar status bar](screenshot2.png)
![Terminal setup](terminals-screenshot.png)

## Quick Start

```powershell
git clone https://github.com/johnsideserf/windows-ricing.git
cd windows-ricing\scripts

# Install all apps via winget (run as admin)
.\install.ps1

# Copy configs to system locations
.\setup-configs.ps1

# Download & apply Bibata cursor
.\setup-cursors.ps1

# Create startup shortcuts (GlazeWM, Wallpaper Engine)
.\setup-startup.ps1

# Apply registry tweaks (dark mode, accent color, hide icons)
.\setup-windows.ps1
```

## What's Included

| Component | Tool | Description |
|---|---|---|
| Window manager | [GlazeWM](https://github.com/glzr-io/glazewm) | Tiling WM with vim-style keybindings |
| Status bar | [Zebar](https://github.com/glzr-io/zebar) | Workspaces, CPU/GPU temps, RAM, battery, weather |
| Hardware monitor | [LibreHardwareMonitor](https://github.com/LibreHardwareMonitor/LibreHardwareMonitor) | Exposes CPU temperature for Zebar (run as admin with Remote Web Server enabled) |
| Terminal | [Windows Terminal](https://github.com/microsoft/terminal) | Acrylic blur, Tokyo Night Storm scheme |
| Shell prompt | [Oh My Posh](https://ohmyposh.dev/) | `1_shell` theme |
| System monitor | [btop4win](https://github.com/aristocratos/btop4win) | Tokyo Storm theme, vim keys |
| Start menu | [Windhawk](https://windhawk.net/) | Translucent acrylic start menu |
| Taskbar | [Windhawk](https://windhawk.net/) | Fully transparent taskbar |
| Cursor | [Bibata Modern Classic](https://github.com/ful1e5/Bibata_Cursor) | Minimal dark cursor theme |
| File manager | [Files](https://files.community/) | Modern file explorer replacement |
| Editor | [Neovim](https://neovim.io/) + [LazyVim](https://www.lazyvim.org/) | IDE-like editor with LSP, autocomplete, treesitter |
| Font | [JetBrainsMono Nerd Font](https://www.nerdfonts.com/) | Used in terminal and status bar |

## Configs

```
configs/
  powershell/        PowerShell profile (PS 7 + PS 5.1)
  windows-terminal/  Terminal settings + Tokyo Night Storm color scheme
  glazewm/           Tiling WM config with workspace rules
  zebar/             Status bar styles + widget HTML
  btop/              System monitor config
  bash/              Git Bash dircolors fix
  claude-code/       Claude Code custom settings
  nvim/              Neovim config (LazyVim)
```

## Manual Steps

These can't be fully automated and need to be done once after running the scripts:

### Font
Download and install **JetBrainsMono Nerd Font** from [nerdfonts.com](https://www.nerdfonts.com/font-downloads). Right-click the `.ttf` files and select "Install for all users".

### Windhawk Mods
Install these mods from the Windhawk GUI after installing Windhawk:
1. **Windows 11 Start Menu Styler** — select the "TranslucentStartMenu" theme
2. **Taskbar height and transparency** (by m417z) — set taskbar opacity to 0

### LibreHardwareMonitor
Required for CPU temperature in the Zebar status bar. After installing, launch it **as administrator** and enable:
- **Options > Remote Web Server > Run**
- **Options > Run On Windows Startup**
- **Options > Start Minimized**

### PowerToys
Optionally install PowerToys (`winget install Microsoft.PowerToys`) and set the **PowerToys Run** hotkey to `` Alt+` `` in settings.

### Taskbar
Go to Settings > Personalization > Taskbar and enable **Automatically hide the taskbar**.

### Wallpaper
Install **Wallpaper Engine** from Steam for animated wallpapers. The startup script creates a shortcut so it launches silently on boot.

## GlazeWM Keybindings

All bindings use the `Alt` key as the modifier.

### Focus
| Key | Action |
|---|---|
| `Alt + H/J/K/L` | Focus left / down / up / right |
| `Alt + 1-9` | Focus workspace 1-9 |
| `Alt + A/S` | Previous / next active workspace |
| `Alt + D` | Last focused workspace |

### Move Window
| Key | Action |
|---|---|
| `Alt + Shift + H/J/K/L` | Move window left / down / up / right |
| `Alt + Shift + 1-9` | Move window to workspace 1-9 |

### Resize
| Key | Action |
|---|---|
| `Alt + U/P` | Shrink / grow width |
| `Alt + I/O` | Shrink / grow height |
| `Alt + R` | Enter resize mode (then H/J/K/L) |

### Window State
| Key | Action |
|---|---|
| `Alt + Space` | Cycle focus (tiling / floating / fullscreen) |
| `Alt + Shift + Space` | Toggle floating (centered) |
| `Alt + T` | Toggle tiling |
| `Alt + F` | Toggle fullscreen |
| `Alt + M` | Minimize |
| `Alt + V` | Toggle tiling direction |
| `Alt + Shift + Q` | Close window |

### WM Control
| Key | Action |
|---|---|
| `Alt + Enter` | Launch terminal |
| `Alt + Shift + P` | Pause / unpause WM |
| `Alt + Shift + R` | Reload config |
| `Alt + Shift + E` | Exit GlazeWM |

## Workspaces

| # | Name | Auto-assigned apps |
|---|---|---|
| 1 | Terminal | Windows Terminal, PowerShell, cmd, Git Bash |
| 2 | Browser | Chrome, Firefox, Edge, Brave |
| 3 | Code | VS Code, Visual Studio, JetBrains IDEs |
| 4 | Chat | Signal, Telegram, Discord, Slack, Teams |
| 5 | Media | Spotify, VLC, mpv |
| 6 | Files | Explorer, Files |
| 7 | Game | Steam |
