# StarLinux and Star Package Manager (SPM)
A Minimal Linux Live-Based Distribution, written for simplicity, automation, and ease-of-use.

## WARNING:
**THIS PROJECT IS IN EARLY DEVELOPMENT, MEANING IT IS BOTH UNSTABLE AND INCOMPLETE.**

## What is StarLinux?
StarLinux is a dream of mine, a Linux Distribution that can be compliled by the user in a specific way to their liking, in the form of my package manager called SPM (Star Package Manager). I originally started playing around with Custom Linux Distributions in the form of Ubuntu Remixes, but found myself uncontent, even with ArchLinux and Gentoo, so I decided to go to the drawing board and create a way for someone to have **FULL CONTROL** of the software on their computers and be a distribution in itself, for curious people like me. This all started with Starbuntu, then Starch, to AwlsomeLinux (which was slopply written and scratched) to StarLinux and SPM, which work hand-and-hand to this dream. StarLinux is the final outcome but SPM is the tool which brings it all together.

## License:
GNU GLPv3 (of course)

## How to Build Star Package Manager:
Execute the `make.sh` in the `spm` folder.

## Required Packages for SPM:
Resolve the following Ubuntu Dependencies:
`sudo apt install build-essential wget bison make gawk gcc bc syslinux genisoimage texinfo`
Ubuntu 18.04 Dependencies:
`sudo apt install build-essential wget bison make gawk gcc bc syslinux genisoimage libelf-dev`

Resolve the following Archlinux Dependencies:
`sudo pacman -S base-devel bison wget make gawk gcc bc syslinux texinfo`

## Credits:
* AwlsomeAlex (Created of StarLinux and SPM)
* Ivandavidov (Creator of MLL and Inspiration)
