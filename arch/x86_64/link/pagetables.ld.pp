#ifndef __ARCH_x86_64_PAGETABLES_LD_PP__
#define __ARCH_x86_64_PAGETABLES_LD_PP__ 1


. = ALIGN(4096);
page_map_level_4 = .;
  LONG( page_dir_ptr & 0x00000000ffffffff | 0x03 ); LONG( page_dir_ptr >> 32 & 0x00000000ffffffff );

  FILL(0);
  . = page_map_level_4 + 511 * 8;
page_map_level_4_end = .;

. = ALIGN(4096);
page_dir_ptr = .;
  LONG( page_dir & 0x00000000ffffffff | 0x03 ); LONG( page_dir >> 32 & 0x00000000ffffffff );

  FILL(0);
  .  = page_dir_ptr + 511 * 8;
page_dir_ptr_end = .;

. = ALIGN(4096);
page_dir = .;
  LONG( page_table & 0x00000000ffffffff | 0x03 ); LONG( page_table >> 32 & 0x00000000ffffffff );

  FILL(0);
  . = page_dir + 511 * 8;
page_dir_end = .;

. = ALIGN(4096);
page_table = .;
  FILL(0);
  . = page_table + 512 * 8;
page_table_end = .;



#endif
