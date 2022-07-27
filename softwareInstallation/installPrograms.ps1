# Rerun this script as administrator if it is not already
if(!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")){
  Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
  Exit
}

# Get the absolute path to the packages configuration file
foreach($path in Write-Output($PSCommandPath -split "\\")){
  if($path -ne "installPrograms.ps1"){
    $softwareInstallation += $path + "\"
  }
}
$packagesPath = $softwareInstallation + "packages.config"
$officePath   = $softwareInstallation + "\ms-office"

# Install chocolatey if it is not yet installed
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Prevent confirmation boxes from showing up, which allows script automation without user interaction
choco feature enable -n=allowGlobalConfirmation

# Upgrade chocolatey
choco upgrade -y chocolatey

# Loops through the contents of 'packages.config' and
# install all packages listed in it, accepting their agreements
foreach($line in Get-Content $packagesPath){
  if ($line.Length -gt 0 -and $line.SubString(0,1) -ne '#'){
    choco install -y $line
  }
}

# Upgrade all packages
choco upgrade all

# Install office
if([System.Environment]::Is64BitOperatingSystem){
  Write-Output("Installing office 64bit...")
  .\$officePath\setup.exe /download configuration-Office365-x64.xml
  .\$officePath\setup.exe /configure configuration-Office365-x64.xml 
}
else{
  Write-Output("Installing office 32bit...")
  .\$officePath\setup.exe /download configuration-Office365-x86.xml
  .\$officePath\setup.exe /configure configuration-Office365-x86.xml
}
Remove-Item "$officePath\office" -Recurse