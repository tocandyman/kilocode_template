\
[CmdletBinding()]
param()

Set-StrictMode -Version Latest

# Ensure admin for system-level installs
$IsAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
if (-not $IsAdmin) { Write-Warning "Run PowerShell as Administrator for full setup." }

# Install winget if missing (Windows 10 1809+ should have it via App Installer)
if (-not (Get-Command winget -ErrorAction SilentlyContinue)) {
  Write-Warning "winget not found. Please install 'App Installer' from Microsoft Store."
}

winget install --silent Git.Git
winget install --silent Microsoft.PowerShell
winget install --silent Python.Python.3.11
winget install --silent JanDeDobbeleer.OhMyPosh
winget install --silent Microsoft.VisualStudioCode
winget install --silent GnuPG.GnuPG
winget install --silent GitHub.cli

# PS modules
try { Install-Module -Name PSReadLine -Force -Scope CurrentUser } catch {}
try { Install-Module -Name posh-git -Force -Scope CurrentUser } catch {}

# Profile
$ProfilePath = "$HOME\Documents\PowerShell\Microsoft.PowerShell_profile.ps1"
New-Item -ItemType Directory -Force (Split-Path $ProfilePath) | Out-Null
@'
Import-Module PSReadLine
Import-Module posh-git
Set-PSReadLineOption -PredictionSource History
oh-my-posh init pwsh | Invoke-Expression
'@ | Out-File -FilePath $ProfilePath -Encoding utf8 -Force

Write-Host "PowerShell dev environment configured."
