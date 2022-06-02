#ifndef __MULTIBOOT2_BOOT_C__
#define __MULTIBOOT2_BOOT_C__ 1


#include "multiboot2.h"

#include "../../arch/x86_64/kernel.h"
#include "../../include/stdint.h"
#include "../../libos/driver/vga/vga.h"


int boot ( uint32_t magic, uint32_t * info_ptr ) {

  boot_data_t boot_data = {
    .multiboot2_info_ptr = info_ptr
  };

  unsigned char magic_ok = ( magic == MULTIBOOT2_MAGIC );

  if ( ! magic_ok ) {
    kwrite("EdgarOS: Multiboot2 magic number is wrong. Halting.");
    return -1;
  }

  kmain(boot_data);

}

#endif
