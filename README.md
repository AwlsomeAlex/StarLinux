# StarLinux
A Minimal Linux Live-Based Distribution, rewritten for simplicity, automation, and ease-of-use.

## What is StarLinux?
StarLinux is an idea I had a long time ago, originally to be made as an Ubuntu-Based Remix, but once I found the Minimal Linux Live Project, I saw that due to my understandings of BASH Scripting, I can easily go much further than a remix, and compile my own Linux Distribution. I started this idea with AwlsomeLinux, but as I look back at it now, it's very sloppy with barely any documentation explaining what's happening behind the hood, so I decided to start fresh, and look back at my MLL roots and rewrite a simple compile process once more. 

## A Tested Concept and the Future of StarLinux:
Just recently I've finally discovered (after many attempts) to have the root directory of the Linux Distribtuion be an actual filesystem (ext2 at the moment) instead of it being pulled from two seperate directories (static root filesystem + overlayfs). This concept will be released as soon as I perfected it but it's basically a **really really** simplified version of Linux From Scratch, but compiled in a complete different way. 

## What's Included with StarLinux?
* StarLinux Kernel Packer (Linux Kernel 4.9.x LTS Branch)
* StarLinux Kernel 4.9.x (Archived for InitramFS Maker Script)
* StarLinux InitramFS Maker (Busybox + GlibC + StarInit)
* StarLinux Installer for Archlinux Live CD (x64 ONLY)

## How to Install:
Resolve the following Ubuntu Dependencies:
`sudo apt install build-essential wget make gawk gcc bc syslinux genisoimage texinfo`

Resolve the following Archlinux Dependencies:
`sudo pacman -S base-devel wget make gawk gcc bc syslinux texinfo`


## Credits:
* AwlsomeAlex (Creator of StarLinux)
* Ivandavidov (Creator of Minimal Linux Live)
