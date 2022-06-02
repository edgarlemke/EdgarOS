#!/bin/bash

ROOT="."
QEMU="$ROOT/tools/BUILD/x86_64/bin/qemu-system-x86_64"
MEM="32"

# QEMU start
#
killall "$QEMU"

if [ "$1" == "-d" ]; then
  "$QEMU" -m "$MEM" -s -S -cdrom os.iso
else
  "$QEMU" -m "$MEM" -s -cdrom os.iso
fi
