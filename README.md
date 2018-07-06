# StarLinux (Protostar Branch)
A small, easy to use Linux Distribution made for ease of use, both to the user and the developer.
[![Build Status](https://travis-ci.com/AwlsomeAlex/StarLinux.svg?branch=protostar)](https://travis-ci.com/AwlsomeAlex/StarLinux)

## WARNING:
**THIS BRANCH IS HIGHLY UNSTABLE AND NOT RECOMMENDED TO USE!**

## What is StarLinux?
StarLinux is a dream of mine, a Linux Distribution that can be compliled by the user in a specific way to their liking, in the form of my package manager called SPM (Star Package Manager). I originally started playing around with Custom Linux Distributions in the form of Ubuntu Remixes, but found myself uncontent, even with ArchLinux and Gentoo, so I decided to go to the drawing board and create a way for someone to have **FULL CONTROL** of the software on their computers and be a distribution in itself, for curious people like me. This all started with Starbuntu, then Starch, to AwlsomeLinux (which was slopply written and scratched) to StarLinux and SPM, which work hand-and-hand to this dream. StarLinux is the final outcome but SPM is the tool which brings it all together.

## What is the Protostar Branch?
Well after a nebula is created and before a star is formed, it is a protostar, the gap between the two, a giant firery gas ball of Hydrogen in space. Here it means the development of SPM which allows packages to be built for StarLinux Systems and Travis CI to build those systems.

## License:
GNU GLPv3 (of course)

## How to Build Star Package Manager:
Execute the `make.sh` in the `spm` folder.

## Required Packages for SPM:
Resolve the following Ubuntu Dependencies:
`sudo apt install build-essential wget bison make gawk gcc bc syslinux genisoimage texinfo sgabios qemu-system-x86`

Ubuntu 18.04 Dependencies:
`sudo apt install build-essential wget bison make gawk gcc bc syslinux genisoimage texinfo libelf-dev sgabios qemu-system-x86`

Resolve the following Archlinux Dependencies:
`sudo pacman -S base-devel bison wget make gawk gcc bc syslinux texinfo`

## Credits:
* AwlsomeAlex (Created of StarLinux and SPM)
* Ivandavidov (Creator of MLL and Inspiration)
