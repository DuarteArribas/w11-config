# == Install office ==
# Install office if office is not installed
$isOfficeInstalled = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\O365ProPlusRetail* | Select-Object DisplayName,DisplayVersion,Publisher
if($isOfficeInstalled -eq $null){
  # Print office installing output
  Write-Output("Office is not installed. Installing office...")
  # Check if the Office installation directory
  # already exists and delete it if so
  if(Test-Path -Path "Office"){
    Remove-Item Office -Recurse
  }
  # Install the corresponding office version (64 bit
  # for 64 bit machines and 32 bit for 32 bit machines)
  if([System.Environment]::Is64BitOperatingSystem){
    Write-Output("Installing office 64bit...")
    .\ms-office\setup.exe /download ms-office\configuration-Office365-x64.xml
    .\ms-office\setup.exe /configure ms-office\configuration-Office365-x64.xml
    Write-Output("Finished office 64bit installation")
  }
  else{
    Write-Output("Installing office 32bit...")
    .\ms-office\setup.exe /download ms-office\configuration-Office365-x86.xml
    .\ms-office\setup.exe /configure ms-office\configuration-Office365-x86.xml
    Write-Output("Finished office 32bit installation")
  }
  # Remove residue of the office installation directory
  Remove-Item Office -Recurse
}
else{
  # Print office already installed output
  Write-Output("Office is already installed. Proceeding...")
}

# == Install other applications ==
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