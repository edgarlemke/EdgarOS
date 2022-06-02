#!/bin/bash


BUILD_MPC="$PREFIX/mpc"


# wget http://www.multiprecision.org/downloads/mpc-1.2.0.tar.gz
tar -xvf mpc-1.2.0.tar.gz


mkdir -p "$BUILD_MPC"
cd "$BUILD_MPC"

$ROOT/mpc-1.2.0/configure --prefix="$PREFIX" --with-gmp-include="$PREFIX/include/" --with-gmp-lib="$PREFIX/lib/"
make
make check
make install
