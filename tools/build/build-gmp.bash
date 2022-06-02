#!/bin/bash

# Dependencies on Debian 10:
# lzip

ROOT="$(dirname $(dirname $(readlink -f $0)))"
BUILD="$ROOT/build"
PREFIX="$ROOT/toolbox"
BUILD_GMP="$PREFIX/build-gmp"
PKG="gmp-6.2.0"
TAR="$PKG.tar.lz"


cd "$BUILD"

if [ ! -e "$TAR" ]; then
  wget https://gmplib.org/download/gmp/gmp-6.2.0.tar.lz
fi

tar -xvf $TAR


mkdir -p "$BUILD_GMP"
cd "$BUILD_GMP"

"$BUILD/$PKG/configure" --prefix="$PREFIX"
make
make check
make install


echo
echo "Flushing $PKG"
rm -rf "$BUILD/$PKG/"
