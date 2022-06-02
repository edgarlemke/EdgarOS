#ifndef __ARCH_x86_64_GDT_LD_PP__
#define __ARCH_x86_64_GDT_LD_PP__ 1


/* default GDT for x86-64 architecture */
. = ALIGN(4);
GDT64 = .;
    /* null descriptor */
    SHORT(0xffff);
    SHORT(0);
    BYTE(0);
    BYTE(0);
    BYTE(1);
    BYTE(0);

    /* code descriptor */
    SHORT(0);
    SHORT(0);
    BYTE(0);
    BYTE(0x9a);
    BYTE(0xaf);
    BYTE(0);

    /* data descriptor */
    SHORT(0);
    SHORT(0);
    BYTE(0);
    BYTE(0x92);
    BYTE(0);
    BYTE(0);

_GDT64_END = .;

/* GDT descriptor for lgdt */
GDT64_DESC = .;
  SHORT(_GDT64_END - GDT64); LONG(GDT64); LONG(GDT64 >> 32);


#endif
