#!/bin/bash


ROOT="$(dirname $(dirname $(readlink -f $0)))"
BUILD="$ROOT/build"
PREFIX="$ROOT/toolbox"
BUILD_BINUTILS="$PREFIX/build-binutils"

PKG="binutils-2.35.1"
TAR="$PKG.tar.gz"

TARGET="x86_64-elf"


cd "$BUILD"

if [ ! -e "$TAR" ]; then
  wget https://ftp.gnu.org/gnu/binutils/binutils-2.35.1.tar.gz
fi

tar -xvf $TAR

mkdir -p "$BUILD_BINUTILS"
cd "$BUILD_BINUTILS"

"$BUILD/$PKG/configure" --target="$TARGET" --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
make
make install

make distclean
rm */config.cache


echo
echo "Flushing $PKG"
rm -rf "$BUILD/$PKG/"
