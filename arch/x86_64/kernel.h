#ifndef __KERNEL_H__
#define __KERNEL_H__


typedef struct _boot_data_t {
  unsigned int * multiboot2_info_ptr;
} boot_data_t;


int kmain ( boot_data_t boot_data );


#endif
