# Rerun this script as administrator if it is not already
if(!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")){
  Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
  Exit
}

# Install chocolatey if it is not yet installed
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Prevent confirmation boxes from showing up, which prevents script automation
choco feature enable -n=allowGlobalConfirmation


# Upgrade chocolatey
choco upgrade -y chocolatey

# Loops through the contents of 'packages.config' and
# install all packages listed in it, accepting their agreements
foreach($line in Get-Content .\packages.config){
  if ($line.Length -gt 0 -and $line.SubString(0,1) -ne '#'){
    choco install -y $line
  }
}

# Upgrade all packages
choco upgrade all