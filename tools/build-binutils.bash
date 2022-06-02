#!/bin/bash


# wget https://ftp.gnu.org/gnu/binutils/binutils-2.35.1.tar.gz
tar -xvf binutils-2.35.1.tar.gz


build () {

  TARGET="$1"
  ROOT="$2"
  PREFIX="$ROOT/BUILD/$3"
  BUILD_BINUTILS="$PREFIX/binutils"

  mkdir -p "$BUILD_BINUTILS"
  cd "$BUILD_BINUTILS"

  $ROOT/binutils-2.35.1/configure --target="$TARGET" --prefix="$PREFIX" --with-sysroot --disable-nls --disable-werror
  make
  make install

  make distclean
  rm */config.cache
}


build "i686-elf" "$ROOT" "x86_64"
build "x86_64-elf" "$ROOT" "x86_64"
