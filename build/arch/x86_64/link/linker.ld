_KERNEL_START = 0x100000;
ENTRY(start)
SECTIONS {
    . = _KERNEL_START + 0xffff800000000000;
    .header : AT( ((ADDR(.header))-0xffff800000000000) ) { *(.header) }
    .text : AT( ((ADDR(.text))-0xffff800000000000) ) {
      *(.boot)
      *(.text)
    }
    .rodata : AT( ((ADDR(.rodata))-0xffff800000000000) ) { *(.rodata) }
    .data : AT( ((ADDR(.data))-0xffff800000000000) ) {
      *(.data);
. = ALIGN(4);
GDT64 = .;
    SHORT(0xffff);
    SHORT(0);
    BYTE(0);
    BYTE(0);
    BYTE(1);
    BYTE(0);
    SHORT(0);
    SHORT(0);
    BYTE(0);
    BYTE(0x9a);
    BYTE(0xaf);
    BYTE(0);
    SHORT(0);
    SHORT(0);
    BYTE(0);
    BYTE(0x92);
    BYTE(0);
    BYTE(0);
_GDT64_END = .;
GDT64_DESC = .;
  SHORT(_GDT64_END - GDT64); LONG(GDT64); LONG(GDT64 >> 32);
. = ALIGN(4);
IDT64 = .;
  SHORT(isr_0x00 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x00 >> 16); LONG(isr_0x00 >> 32); LONG(0);;
  SHORT(isr_0x01 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x01 >> 16); LONG(isr_0x01 >> 32); LONG(0);;
  SHORT(isr_0x02 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x02 >> 16); LONG(isr_0x02 >> 32); LONG(0);;
  SHORT(isr_0x03 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x03 >> 16); LONG(isr_0x03 >> 32); LONG(0);;
  SHORT(isr_0x04 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x04 >> 16); LONG(isr_0x04 >> 32); LONG(0);;
  SHORT(isr_0x05 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x05 >> 16); LONG(isr_0x05 >> 32); LONG(0);;
  SHORT(isr_0x06 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x06 >> 16); LONG(isr_0x06 >> 32); LONG(0);;
  SHORT(isr_0x07 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x07 >> 16); LONG(isr_0x07 >> 32); LONG(0);;
  SHORT(isr_0x08 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x08 >> 16); LONG(isr_0x08 >> 32); LONG(0);;
  SHORT(isr_0x09 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x09 >> 16); LONG(isr_0x09 >> 32); LONG(0);;
  SHORT(isr_0x0a & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x0a >> 16); LONG(isr_0x0a >> 32); LONG(0);;
  SHORT(isr_0x0b & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x0b >> 16); LONG(isr_0x0b >> 32); LONG(0);;
  SHORT(isr_0x0c & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x0c >> 16); LONG(isr_0x0c >> 32); LONG(0);;
  SHORT(isr_0x0d & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x0d >> 16); LONG(isr_0x0d >> 32); LONG(0);;
  SHORT(isr_0x0e & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x0e >> 16); LONG(isr_0x0e >> 32); LONG(0);;
  SHORT(isr_0x0f & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x0f >> 16); LONG(isr_0x0f >> 32); LONG(0);;
  SHORT(isr_0x10 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x10 >> 16); LONG(isr_0x10 >> 32); LONG(0);;
  SHORT(isr_0x11 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x11 >> 16); LONG(isr_0x11 >> 32); LONG(0);;
  SHORT(isr_0x12 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x12 >> 16); LONG(isr_0x12 >> 32); LONG(0);;
  SHORT(isr_0x13 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x13 >> 16); LONG(isr_0x13 >> 32); LONG(0);;
  SHORT(isr_0x14 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x14 >> 16); LONG(isr_0x14 >> 32); LONG(0);;
  SHORT(isr_0x15 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x15 >> 16); LONG(isr_0x15 >> 32); LONG(0);;
  SHORT(isr_0x16 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x16 >> 16); LONG(isr_0x16 >> 32); LONG(0);;
  SHORT(isr_0x17 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x17 >> 16); LONG(isr_0x17 >> 32); LONG(0);;
  SHORT(isr_0x18 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x18 >> 16); LONG(isr_0x18 >> 32); LONG(0);;
  SHORT(isr_0x19 & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x19 >> 16); LONG(isr_0x19 >> 32); LONG(0);;
  SHORT(isr_0x1a & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x1a >> 16); LONG(isr_0x1a >> 32); LONG(0);;
  SHORT(isr_0x1b & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x1b >> 16); LONG(isr_0x1b >> 32); LONG(0);;
  SHORT(isr_0x1c & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x1c >> 16); LONG(isr_0x1c >> 32); LONG(0);;
  SHORT(isr_0x1d & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x1d >> 16); LONG(isr_0x1d >> 32); LONG(0);;
  SHORT(isr_0x1e & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x1e >> 16); LONG(isr_0x1e >> 32); LONG(0);;
  SHORT(isr_0x1f & 0x0000ffff); SHORT(0x08); BYTE(0); BYTE(0x8e); SHORT(isr_0x1f >> 16); LONG(isr_0x1f >> 32); LONG(0);;
_IDT64_END = .;
IDT64_DESC = .;
  SHORT(_IDT64_END - IDT64); LONG(IDT64); LONG(IDT64 >> 32);
. = ALIGN(4096);
page_map_level_4 = .;
  LONG( ((page_dir_ptr)-0xffff800000000000) | 0x03 ); LONG( ((page_dir_ptr)-0xffff800000000000) >> 32 );
  FILL(0);
  . = page_map_level_4 + 256 * 8;
  LONG( ((page_dir_ptr)-0xffff800000000000) | 0x03 ); LONG( ((page_dir_ptr)-0xffff800000000000) >> 32 );
  FILL(0);
  . = page_map_level_4 + 511 * 8;
page_map_level_4_end = .;
. = ALIGN(4096);
page_dir_ptr = .;
  LONG( ((page_dir)-0xffff800000000000) | 0x03 ); LONG( ((page_dir)-0xffff800000000000) >> 32 );
  FILL(0);
  . = page_dir_ptr + 511 * 8;
page_dir_ptr_end = .;
. = ALIGN(4096);
page_dir = .;
  LONG( ((page_table)-0xffff800000000000) | 0x03 ); LONG( ((page_table)-0xffff800000000000) >> 32 );
  FILL(0);
  . = page_dir + 511 * 8;
page_dir_end = .;
. = ALIGN(4096);
page_table = .;
  FILL(0);
  . = page_table + 512 * 8;
page_table_end = .;
    }
    .bss : AT( ((ADDR(.bss))-0xffff800000000000) ) {
       *(COMMON)
       *(.bss)
    }
    .stack : AT( ((ADDR(.stack))-0xffff800000000000) ) { *(.stack) }
    _KERNEL_END = ((.)-0xffff800000000000);
}
