#!/bin/bash


ROOT="$(dirname $(dirname $(readlink -f $0)))"
BUILD="$ROOT/build"
PREFIX="$ROOT/toolbox"
BUILD_GCC="$PREFIX/build-gcc"

PKG="gcc-10.2.0"
TAR="$PKG.tar.gz"

TARGET="x86_64-elf"


cd "$BUILD"

if [ ! -e "$TAR" ]; then
  wget http://ftpmirror.gnu.org/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.gz
fi

tar -xvf $TAR 

mkdir -p "$BUILD_GCC"
cd "$BUILD_GCC"

"$BUILD/$PKG/configure" --target="$TARGET" --prefix="$PREFIX" --disable-nls --enable-languages=c --without-headers --with-gmp-include="$PREFIX/include/" --with-gmp-lib="$PREFIX/lib/" --with-mpfr-include="$PREFIX/include" --with-gmp-lib="$PREFIX/lib/"
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc

make distclean
rm */config.cache


echo
echo "Flushing $PKG"
rm -rf "$BUILD/$PKG/"
