#!/bin/bash

# Dependencies on Debian 10:
# lzip
# gcc-i686-linux-gnu
# ninja
# pkg-config
# libglib2.0 libglib2.0-dev
# libpixman-1.0 libpixman-1-dev
# libsdl2-dev
# libgtk-3-dev


export ROOT="$(pwd)"
export PREFIX="$ROOT/BUILD/x86_64/"
export TARGET="x86_64-elf"

mkdir -p "$PREFIX"
mkdir -p "$PREFIX/bin"

./build-gmp.bash
sleep 3

./build-mpfr.bash
sleep 3

./build-mpc.bash
sleep 3

./build-binutils.bash
sleep 3

./build-gcc.bash
sleep 3

./build-qemu.bash
sleep 3