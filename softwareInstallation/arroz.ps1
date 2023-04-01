if(!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]"Administrator")){
  Write-Output("This shell does not have administrative privileges. Rerunning in administrative mode...")
  Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
  Exit
}

echo "arroz"
cp .\updatePrograms.ps1 "C:\Users\$env:UserName\"
cp .\updatePrograms.cmd "C:\Users\$env:UserName\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\"

Start-Sleep -Seconds 10