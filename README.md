# StarLinux (Nebula Branch)
StarLinux Nebula is the current codename for the StarLinux Core which will power other StarLinux Projects like StarLinux Server and USBlinux. StarLinux itself is a MLL-like distribution with a different filesystem and its own package manager SPM (Star Package Manager). This repository will contain the scripts used to make StarLinux Core Images and Update Scripts along with other ported software.

## Nebula (StarLinux Core) Packages:
* Linux Kernel 5.0.x
* GNU C Library 2.28 (Minimal) 
* BusyBox Userland 1.30.1 (Stable)
* Xiongnu 1.2.4a [INIT] (In-Development)

## How to Build:
### Dependencies (Debian/Ubuntu - What I use):
`sudo apt install wget make gawk gcc bc bison flex xorriso libelf-dev libssl-dev`

### Dependencies (Fedora - Untested)
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

