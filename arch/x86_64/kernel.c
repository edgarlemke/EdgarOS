#ifndef __KERNEL_C_
#define __KERNEL_C_ 1


#include "kernel.h"

#include "../../include/stdlib.h"
#include "../../include/stdint.h"

#include "../../libos/driver/vga/vga.h"
#include "../../libos/mem/phymem/phymem.h"


int kmain ( boot_data_t boot_data ) {

  uint64_t * phymem_ptr;
  char ptr_str[19];

  kinitvga();

  /*const*/ char * edgaros = "EdgarOS\n";
  kcwrite( edgaros, YELLOW, BLACK );

  // init_phymem(boot_data);
  //
  // phymem_ptr = phymem_alloc(256);
  // itoa( (uint64_t) phymem_ptr, ptr_str, 16 );
  // kwrite("phymem_ptr:"); kwrite(ptr_str); kwrite("\n");
  //
  // uint64_t * phymem_ptr2 = phymem_alloc(256);
  // itoa( (uint64_t) phymem_ptr2, ptr_str, 16 );
  // kwrite("phymem_ptr2:"); kwrite(ptr_str); kwrite("\n");
  //
  // uint64_t * phymem_ptr3 = phymem_alloc(256);
  // itoa( (uint64_t) phymem_ptr3, ptr_str, 16 );
  // kwrite("phymem_ptr3:"); kwrite(ptr_str); kwrite("\n");
  //
  // phymem_free( phymem_ptr2 );
  // phymem_free( phymem_ptr );
  //
  // uint64_t * phymem_ptr4 = phymem_alloc(512);
  // itoa( (uint64_t) phymem_ptr4, ptr_str, 16 );
  // kwrite("phymem_ptr4:"); kwrite(ptr_str); kwrite("\n");
  //
  // uint64_t * phymem_ptr5 = phymem_alloc(512);
  // itoa( (uint64_t) phymem_ptr5, ptr_str, 16 );
  // kwrite("phymem_ptr5:"); kwrite(ptr_str); kwrite("\n");

  // while(1){};

  // uint64_t * phymem_ptr4 = phymem_alloc(128);
  // itoa( (uint64_t) phymem_ptr4, ptr_str, 16 );
  // kwrite("phymem_ptr4:"); kwrite(ptr_str); kwrite("\n");
  //
  // uint64_t * phymem_ptr5 = phymem_alloc(128);
  // itoa( (uint64_t) phymem_ptr5, ptr_str, 16 );
  // kwrite("phymem_ptr5:"); kwrite(ptr_str); kwrite("\n");
  //
  // uint64_t * phymem_ptr6 = phymem_alloc(128);
  // itoa( (uint64_t) phymem_ptr6, ptr_str, 16 );
  // kwrite("phymem_ptr6:"); kwrite(ptr_str); kwrite("\n");

  /*
  init_vmem();

  init_clock();

  init_sched();

  init_storage();

  init_fs();
  --> seek boot routine
  */

  return 0;

}

#endif
