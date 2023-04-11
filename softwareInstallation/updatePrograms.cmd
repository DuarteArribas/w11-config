PowerShell -Command "Set-ExecutionPolicy -Scope CurrentUser RemoteSigned -Force" >> "%TEMP%\StartupLog.txt" 2>&1
PowerShell C:\updatePrograms.ps1 >> "%TEMP%\StartupLog.txt" 2>&1