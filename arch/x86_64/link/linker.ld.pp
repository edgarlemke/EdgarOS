#ifndef __ARCH_x86_64_LINKER_LD__
#define __ARCH_x86_64_LINKER_LD__ 1

ENTRY(start)

SECTIONS {
    . = 1M;

    .header : { *(.header) }

    .text : { *(.text) }

    .rodata : { *(.rodata) }

    .data : {
      *(.data);

      #include "gdt.ld.pp"
      #include "idt.ld.pp"
      #include "pagetables.ld.pp"

    }

    .bss : {
       *(COMMON)
       *(.bss)
    }

    .stack : { *(.stack) }
}


#endif
