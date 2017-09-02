# StarLinux
A Linux Distribution that you compile, the way you want it with the latest packages available!

## What is StarLinux?
StarLinux is an idea I had a long time ago, originally to be made as an Ubuntu-Based Remix, but once I found the Minimal Linux Live Project, I saw that due to my understandings of BASH Scripting, I can easily go much further than a remix, and compile my own Linux Distribution. I started this idea with AwlsomeLinux, but as I look back at it now, it's very sloppy with barely any documentation explaining what's happening behind the hood, so I decided to start fresh, and look back at my MLL roots and rewrite a simple compile process once more.

## Build Options:
* **UPDATE** - The Core InitramFS + Default Kernel Recipe for updating an already-compiled StarLinux.
* **NEBULA** - The Bare Minium for Linux to boot. (Kernel, GlibC, BusyBox, Starinit)
* **STATIC** - The Bare Packages needed for Linux to boot & The static-get Script. (Kernel, GlibC, BusyBox, Starinit, static-get, Network Drivers)
* **PROTOSTAR** - The Bare Packages needed for Linux to boot & The SPM Package Manager. (Kernel, GlibC, BusyBox, Starinit, SPM, Network Drviers)
* **SUN** - The Core Packages needed for most Linux Distributions to be Self-Hosted. (Kernel, GlibC, GNU Userland, Starinit, SPM, Network+FS Drivers, etc. packages)
* **SUPERNOVA** - A fully featured Linux Distributions with TUI Utilities such as Links, Mutt, etc. (Kernel, GlibC, GNU Userland, Starinit, SPM, StarLaunch, Network+FS Drivers, etc. packages)
* **NEUTRON** - StarLinux [SUPERNOVA] + Xorg User Interface (Kernel, GlibC, GNU Userland, Starinit, SPM, Xorg, Network+FS Drivers, etc. packages)

## Package Recipes:
* The Linux Kernel + Header/Firmware/Module
* GNU C Library + Full Library Support
* BusyBox Userland
* Starinit SysVinit-Type Init Scripts

## How to Install:
Resolve the following Ubuntu Dependencies:
`sudo apt install build-essential wget make gawk gcc bc syslinux genisoimage texinfo`

Resolve the following Archlinux Dependencies:
`sudo pacman -S base-devel wget make gawk gcc bc syslinux texinfo`


## Credits:
* AwlsomeAlex (Creator of StarLinux)
* Ivandavidov (Creator of Minimal Linux Live)
