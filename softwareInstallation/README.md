# Software Installation

Installing software is a tedious, repetitive and prone-to-errors process. Using the *[Chocolatey](https://chocolatey.org/)* package manager, it is possible to automate software **installation** and **upgrading**.

## Disclaimer

This script was made for my own use and, although tested, may cause unwanted behavior for some people. Use at your own risk.

## Run program installation

Clone the project if it is not cloned already:

```bash
git clone git@github.com:DuarteArribas/w11-config.git
```

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

To actually install the packages, run powershell and execute `installPrograms.ps1`:

```powershell
.\installPrograms.ps1 [-office]
```

The `-office` flag, when specified with false, will make it so that office is not installed.

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
League of Legends (Riot client)
Battle.net
Epic games
Rainmeter
GoogleDrive
```
