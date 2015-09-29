# Armus Linux Work Around.

This thing uses a combination of: 
 * the compiler (and linker) from the linux toolchain given on ArmusWiki
 * The more up-to-date library (includes) from the windows ArmusIDE version

Ive been trying to compile with arm-linux-gnueabihf-g++ (4.9.2) available in the emdebian repo, but it did not work.
I may fix it someday.

# How to use

* Download or clone this repo.

* Download the linux files and the windows files from ArmusWiki and place them in the appropriate folders.

* Create a project in the "projects" folder.

* Follow the example.

# Example

look at the example Makefile and project here:

https://github.com/antoineMoPa/armus-linux-wa/tree/master/projects/test

# Creating a new project

Just copy the example [Makefile](https://github.com/antoineMoPa/armus-linux-wa/blob/master/projects/test/Makefile) and write some code in /projects/your-new-folder. Dont forget to change the project name in the Makefile!

# Making

If you don't `make clean`, you will not rebuild, since files will already exist. It will only relink the old build.

So, Always do that:

    make clean; make
