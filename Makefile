
# Change project name here
NAME=projects/test/test
CFILE=$(NAME).cpp
PWD=$(shell pwd)

LIN_TOOLCHAIN=$(PWD)/linux-files/toolchain
LIN_BIN=$(LIN_TOOLCHAIN)/bin
WIN_TOOLCHAIN=$(PWD)/windows-files/toolchain
WIN_LIBRARY=$(PWD)/windows-files/librairie

#CC=/usr/bin/arm-linux-gnueabihf-g++
CC=$(LIN_BIN)/arm-softfloat-linux-gnueabi-g++

CFLAGS+=-c
CFLAGS+=--sysroot=$(WIN_TOOLCHAIN)/sysroot
CFLAGS+=-I $(WIN_TOOLCHAIN)/sysroot/usr/include
CFLAGS+=-I $(WIN_LIBRARY)
CFLAGS+=-I $(WIN_LIBRARY)/include
CFLAGS+=-ggdb
CFLAGS+=-MMD
CFLAGS+=-MP
CFLAGS+=-MF"$(NAME).d"
CFLAGS+=-MT"$(NAME).d"
CFLAGS+=-o "$(NAME).o"
CFLAGS+=-mfloat-abi=softfp


# LINKING VARIABLES

LFILE=$(NAME).o

LFLAGS=-unresolved-symbols=ignore-in-shared-libs
LFLAGS+=-L $(WIN_LIBRARY)/lib
LFLAGS+=-Xlinker
LFLAGS+=--unresolved-symbols=ignore-in-shared-libs
LFLAGS+=--sysroot=$(WIN_TOOLCHAIN)/sysroot
LFLAGS+=-o $(NAME).exe
LFLAGS+=-larmus2_0
LFLAGS+=-larmus
LFLAGS+=-lmad
LFLAGS+=-lpthread
LFLAGS+=-lasound
LFLAGS+=-lid3tag


# link dépend de compile

all: $(NAME).exe

$(NAME).exe: link

$(NAME).o:
	$(info * compiling *)
	$(CC) $(CFLAGS) $(CFILE)

link: $(NAME).o
	$(info * linking *)
	$(CC) $(LFLAGS) $(LFILE)


clean:
	rm $(NAME).o $(NAME).d $(NAME).exe
