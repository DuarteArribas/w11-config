# Install chocolatey if it is not yet installed
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

# Upgrade chocolatey
choco upgrade -y chocolatey

# Loops through the contents of 'packages.config' and
# install all packages listed in it, accepting their agreements
foreach($line in Get-Content .\packages.config){
  if ($line.SubString(0,1) -ne '#'){
    choco install -y $line 
  }
}

# Upgrade all packages
choco upgrade all