# Allow this script to run
Set-ExecutionPolicy Bypass -Scope Process

# Install chocolatey if it is not yet installed
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Upgrade chocolatey
choco upgrade -y chocolatey

# Loops through the contents of 'packages.config'
foreach($line in Get-Content .\packages.config){
  $packages += $line + " "
}

# Install all packages listed in 'packages.config', accepting their agreements
choco install -y $packages