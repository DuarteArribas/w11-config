# Software Installation

Installing software is a tedious, repetitive and prone-to-errors process. Using the *[Chocolatey](https://chocolatey.org/)* package manager, it is possible to automate software **installation** and **upgrading**.
## Disclaimer

This script was made for my own use and, although tested, may cause unwanted behavior for some people. Use at your own risk.
## Run

Clone the project:

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

To actually install the packages, run powershell and execute `installPrograms.ps1`:

```powershell
  .\installPrograms.ps1
```