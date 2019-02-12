# StarLinux (Nebula Branch)
StarLinux Nebula is the current codename for the StarLinux Core which will power other StarLinux Projects like StarLinux Server and USBlinux. StarLinux itself is a MLL-like distribution with a different filesystem and its own package manager SPM (Star Package Manager). This repository will contain the scripts used to make StarLinux Core Images and Update Scripts along with other ported software.

## Nebula (StarLinux Core) Packages:
* Linux Kernel 4.19.x
* GNU C Library 2.28 (Minimal) or musl C Library 1.1.20 (Experimental)
* BusyBox Userland 1.29.3 (Stable) or Toybox Userland 0.7.8 (Experimental)
* Xiongnu 0.1a [INIT] (In-Development)

## How to Build:
### Dependencies (Debian/Ubuntu - Untested):
`sudo apt install wget make gawk gcc bc bison flex xorriso libelf-dev libssl-dev`

### Dependencies (Fedora - What I use)
`sudo dnf install @development-tools gcc xorriso make bison flex automake gcc-c++ m4 openssl-devel texinfo squashfs-tools`

### Compile (Linux):
* `./spb.sh build prepare`
* `./spb.sh build linux`
* `./spb.sh build glibc`
* `./spb.sh build busybox`
* `./spb.sh build libstar`
* `./spb.sh build xiongnu`
* `./spb.sh build syslinux`
* `./spb.sh build image`

StarLinux itself is built with the Star Package Builder which also compiles and packages the software needed for StarLinux to work.

### Install (Using ArchLinux):
TO BE ADDED!

### Install (Built-in Install Script):
TO BE DEVELOPED!

## Contributors:
* AwlsomeAlex (Project Manager)
* Ivandavidov (Layed down the foundation for a Minimal Linux Distribution)

