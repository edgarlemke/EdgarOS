#!/bin/bash


ROOT="$(dirname $(dirname $(readlink -f $0)))"
BUILD="$ROOT/build"
PREFIX="$ROOT/toolbox"
BUILD_MPC="$PREFIX/build-mpc"
PKG="mpc-1.2.0"
TAR="$PKG.tar.gz"


cd "$BUILD"

if [ ! -e "$TAR" ]; then
  wget http://www.multiprecision.org/downloads/mpc-1.2.0.tar.gz
fi

tar -xvf $TAR


mkdir -p "$BUILD_MPC"
cd "$BUILD_MPC"

"$BUILD/$PKG/configure" --prefix="$PREFIX" --with-gmp-include="$PREFIX/include/" --with-gmp-lib="$PREFIX/lib/"
make
make check
make install


echo
echo "Flushing $PKG"
rm -rf "$BUILD/$PKG/"
