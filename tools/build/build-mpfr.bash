#!/bin/bash


ROOT="$(dirname $(dirname $(readlink -f $0)))"
BUILD="$ROOT/build"
PREFIX="$ROOT/toolbox"
BUILD_MPFR="$PREFIX/build-mpfr"
PKG="mpfr-4.1.0"
TAR="$PKG.tar.gz"


cd "$BUILD"

if [ ! -e "$TAR" ]; then
  wget https://www.mpfr.org/mpfr-current/mpfr-4.1.0.tar.gz
fi

tar -xvf $TAR 


mkdir -p "$BUILD_MPFR"
cd "$BUILD_MPFR"

"$BUILD/$PKG/configure" --prefix="$PREFIX" --with-gmp-include="$PREFIX/include/" --with-gmp-lib="$PREFIX/lib/"
make
make check
make install


echo
echo "Flushing $PKG"
rm -rf "$BUILD/$PKG/"
