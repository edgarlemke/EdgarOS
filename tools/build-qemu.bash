#!/bin/bash

# Dependencies on Debian 10:
# libsdl2-dev
# libgtk-3-dev
# gettext

#export ROOT="$(pwd)"
#export PREFIX="$ROOT/BUILD/x86_64"
#export BUILD_QEMU="$PREFIX/qemu"
BUILD_QEMU="$PREFIX/qemu"


# wget https://download.qemu.org/qemu-5.1.0.tar.xz
tar -xvf qemu-5.1.0.tar.xz

mkdir -p "$BUILD_QEMU"
cd "$BUILD_QEMU"


"$ROOT/qemu-5.1.0/configure" --prefix="$PREFIX" --target-list="x86_64-softmmu" --enable-sdl --enable-gtk --enable-debug
make
make install
