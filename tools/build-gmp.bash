#!/bin/bash

# Dependencies on Debian 10:
# lzip


BUILD_GMP="$PREFIX/gmp"


# wget https://gmplib.org/download/gmp/gmp-6.2.0.tar.lz
tar -xvf gmp-6.2.0.tar.lz


mkdir "$BUILD_GMP"
cd "$BUILD_GMP"

$ROOT/gmp-6.2.0/configure --prefix="$PREFIX"
make
make check
make install
