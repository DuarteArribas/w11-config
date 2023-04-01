# Software Installation

Installing software is a tedious, repetitive and prone-to-errors process. Using the *[Chocolatey](https://chocolatey.org/)* package manager, it is possible to automate software **installation** and **upgrading**.

## Disclaimer

This script was made for my own use and, although tested, may cause unwanted behavior for some people. Use at your own risk.

## Run program installation

Clone the project if it is not cloned already:

```bash
git clone git@github.com:DuarteArribas/w11-config.git
```

Alternatively, download the zip and unzip it for windows.

Go to the project directory:

```bash
cd softwareInstallation
```

Change the file `packages.config` to include the packages you want to install. Packages that should **not** be installed should be commented, by prefixing the package with a `#`. E.G.:

```
# == Browsers ==
googlechrome
#firefox
#brave
#microsoft-edge
#chromium
#vivaldi
opera
#tor-browser

# == Compression && Archiving ==
7zip
winrar
#peazip
```

In the previous example, **google chrome**, **opera**, **7zip** and **winrar** would have been installed.

Office is installed by default (read on to figure out how to not install it by default). If you wish to install office, change the `configuration-Office365-x64.xml` file or the `configuration-Office365-x86.xml` file, depending if you have windows 32bit or 64bit and follow the intructions on the comment header, so that only the specific programs from the office suite that you wish are installed.

Run `Set-ExecutionPolicy Bypass -Scope Process -Force`, so that the script can be executed.

To actually install the packages, run powershell and execute `installPrograms.ps1`:

```powershell
.\installPrograms.ps1 [-office] [-wsl]
```

The `-office` flag, when specified with false, will make it so that office is not installed.
The `-wsl` flag, when specified with false, will make it so that wsl is not installed.

This script will reboot the PC a couple times (depending on the software you wish to install, but at least one time at the end). If the script finishes executing (i.e., the message saying that all the installations were complete is shown), then the script does not need to be ran anymore; if not, then the reboots may be needed reboots in the middle of the script, hence the script needs to be rerun.

## Run program updating

Go to the project directory:

```bash
cd softwareInstallation
```

To update all packages, execute `updatePrograms.ps1`:

```powershell
.\updatePrograms.ps1
```

## Manual installation

The following programs I usually also install, but need to be installed manually:

```
Battle.net
```
