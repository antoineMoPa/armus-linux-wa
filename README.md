# armus-linux-wa
Armus Linux Work Around.

This thing uses a combination of: 
 * the compiler (and linker) from the linux toolchain given on ArmusWiki
 * The more up-to-date library (includes) from the windows ArmusIDE version

Ive been trying to compile with arm-linux-gnueabihf-g++ (4.9.2) available in the emdebian repo, but it did not work.
I may fix it someday.

# How to use

Download or clone this repo.

Download the linux files and the windows files from ArmusWiki and place them in the appropriate folders.

Change the variable "NAME" in the makefile and run make.

NAME should be the name of your main cpp file without the extension (which should be ".cpp").
