#!/bin/bash

# Base paths
ROOT="."
BUILD="$ROOT/build"

# Tools paths
export GAS_x86_64="$ROOT/tools/BUILD/x86_64/bin/x86_64-elf-as"
export GCC_x86_64="$ROOT/tools/BUILD/x86_64/bin/x86_64-elf-gcc"
export LD_x86_64="$ROOT/tools/BUILD/x86_64/bin/x86_64-elf-ld"
export CPP_X86_64="$ROOT/tools/BUILD/x86_64/bin/x86_64-elf-cpp"


# Flush old BUILD
rm -rf $BUILD

# Create BUILD
IGNORE_BUILD="./.git* ./build* ./iso* ./tools*"

src_subdirs=$( find -type d \
            -not -path "./.git*" \
            -not -path "./build*" \
            -not -path "./iso*" \
            -not -path "./tools*" \
            -not -path "." )
for src_subdir in $src_subdirs; do
  mkdir -p "$BUILD/$src_subdir"
done


#src_dirs=$( find -type d \
#            -not -path "./.git*" \
#            -not -path "./build*" \
#            -not -path "./iso*" \
#            -not -path "./tools*" \
#            -not -path "./*/*" \
#            -not -path "." )
#echo "Source dirs: $src_dirs"
#echo

src_dirs=""
for src_subdir in $src_subdirs; do
 x=$(echo $src_subdir | grep -v -e "^\./.*/.*")
 src_dirs="$src_dirs $x"
done
echo "Source dirs: $src_dirs"

iter_build () {

  for dir_ in $src_dirs; do
    files=$(find $dir_/ | grep -e $1)

    for file in $files; do
      output_file="$BUILD/$file.elf"

      tmp_=${2/\$output_file/$output_file}
      cmd=${tmp_/\$file/$file}
      echo $cmd

      $cmd
      if [ $? -gt 0 ]; then
        echo ERROR
        exit
      fi

      echo OK

    done

  done
}


# iter_build assembly files
iter_build ".asm$" "$GAS_x86_64 -o \$output_file \$file"
echo


# Default arguments for the C compiler
CARGS="-ffreestanding -fno-builtin -nostdinc -nostdlib -fno-asynchronous-unwind-tables"

# iter_build C files
iter_build ".c$" "$GCC_x86_64 -o \$output_file -c \$file $CARGS"
echo


# Link script pre-processing
LINKER_LD_PP="$ROOT/arch/x86_64/link/linker.ld.pp"
LINKER_LD="$ROOT/arch/x86_64/link/linker.ld"

cmd="$CPP_X86_64 -P $LINKER_LD_PP"
echo "$cmd > $LINKER_LD"

$cmd > $LINKER_LD
if [ $? -gt 0 ]; then
  echo ERROR
  exit
fi

echo OK
echo


# Linking
ELFS=$(find $BUILD/ | grep -e ".elf$")
echo "ELFs for linking: $ELFS"
echo

OS_BIN="$ROOT/os.bin"

cmd="$LD_x86_64 -n -o $OS_BIN -T$LINKER_LD $ELFS"
echo $cmd

$cmd
if [ $? -gt 0 ]; then
  echo ERROR
  exit
fi

echo OK
echo


echo Creating ISO
cp "$OS_BIN" "$ROOT/iso/boot/os.bin"
grub-mkrescue -o os.iso "$ROOT/iso/"
