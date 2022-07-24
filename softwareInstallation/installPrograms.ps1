# Loops through the contents of 'packages.config'
foreach($line in Get-Content .\packages.config){
  $packages += $line + " "
}

# Install all packages listed in 'packages.config', accepting their agreements
choco install -y $packages