# Rerun this script as administrator if it is not already
if(!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")){
  Write-Output("This shell does not have administrative privileges. Rerunning in administrative mode...")
  Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
  Exit
}

# Upgrade all packages
choco upgrade all