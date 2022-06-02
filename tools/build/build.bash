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


ROOT="$(dirname $(dirname $(readlink -f $0)))"
BUILD="$ROOT/build"
PREFIX="$ROOT/toolbox"

mkdir -p "$PREFIX"


$BUILD/build-gmp.bash
sleep 3

$BUILD/build-mpfr.bash
sleep 3

$BUILD/build-mpc.bash
sleep 3

$BUILD/build-binutils.bash
sleep 3

$BUILD/build-gcc.bash
sleep 3
