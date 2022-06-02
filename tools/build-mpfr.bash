#!/bin/bash


BUILD_MPFR="$PREFIX/mpfr"


# wget https://www.mpfr.org/mpfr-current/mpfr-4.1.0.tar.gz
tar -xvf mpfr-4.1.0.tar.gz


mkdir -p "$BUILD_MPFR"
cd "$BUILD_MPFR"

$ROOT/mpfr-4.1.0/configure --prefix="$PREFIX" --with-gmp-include="$PREFIX/include/" --with-gmp-lib="$PREFIX/lib/" #--with-gmp-build="$BUILD_GMP"
make
make check
make install
