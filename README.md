# StarLinux (Star Package Builder Branch)
A small, easy to use Linux Distribution made for ease of use, both to the user and the developer.

## WARNING:
**THIS BRANCH IjS HIGHLY UNSTABLE AND NOT RECOMMENDED TO USE!**

## What is StarLinux?
StarLinux is a dream of mine, a Linux Distribution that can be compliled by the user in a specific way to their liking, in the form of my package manager called SPM (Star Package Manager). I originally started playing around with Custom Linux Distributions in the form of Ubuntu Remixes, but found myself uncontent, even with ArchLinux and Gentoo, so I decided to go to the drawing board and create a way for someone to have **FULL CONTROL** of the software on their computers and be a distribution in itself, for curious people like me. This all started with Starbuntu, then Starch, to AwlsomeLinux (which was slopply written and scratched) to StarLinux and SPM, which work hand-and-hand to this dream. StarLinux is the final outcome but SPM is the tool which brings it all together.

## What is the Star Package Builder Branch?
I still can't get the whole "Build StarLinux" thing right, so I'm redoing the Star Package Builder to include user-customizable Configuration Files and a lot more user and code friendliness!

## License:
GNU GLPv3 (of course)

## How to Build Star Package Builder:
Execute `spb.sh make` in the terminal. (Make sure shc is installed via `sudo apt install shc`)

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
