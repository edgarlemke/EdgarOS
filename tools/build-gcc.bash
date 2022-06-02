#!/bin/bash


# wget http://ftpmirror.gnu.org/gnu/gcc/gcc-10.2.0/gcc-10.2.0.tar.gz
tar -xvf gcc-10.2.0.tar.gz


build () {

  TARGET="$1"
  ROOT="$2"
  PREFIX="$ROOT/BUILD/$3"
  BUILD_GCC="$PREFIX/gcc"

  mkdir -p "$BUILD_GCC"
  cd "$BUILD_GCC"

  "$ROOT/gcc-10.2.0/configure" --target="$TARGET" --prefix="$PREFIX" --disable-nls --enable-languages=c --without-headers --with-gmp-include="$PREFIX/include/" --with-gmp-lib="$PREFIX/lib/" --with-mpfr-include="$PREFIX/include" --with-gmp-lib="$PREFIX/lib/"
  make all-gcc
  make all-target-libgcc
  make install-gcc
  make install-target-libgcc

  make distclean
  rm */config.cache

}


build "i686-elf" "$ROOT" "x86_64"
build "x86_64-elf" "$ROOT" "x86_64"