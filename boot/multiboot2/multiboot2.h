#ifndef __MULTIBOOT2_MULTIBOOT2_H__
#define __MULTIBOOT2_MULTIBOOT2_H__ 1


#include "../../arch/x86_64/kernel.h"


#define MULTIBOOT2_MAGIC 0x36d76289

#define MULTIBOOT_TAG_TYPE_MMAP 6


typedef struct _mmap_entry {
  unsigned long int addr;
  unsigned long int len;
  unsigned int type;
  unsigned int reserved;
} mmap_entry;
/* Valid values of mmap_entry.type */
#define MULTIBOOT_MEMORY_AVAILABLE              1
#define MULTIBOOT_MEMORY_RESERVED               2
#define MULTIBOOT_MEMORY_ACPI_RECLAIMABLE       3
#define MULTIBOOT_MEMORY_NVS                    4
#define MULTIBOOT_MEMORY_BADRAM                 5


typedef struct _mmap_tag {
  unsigned int type;
  unsigned int size;
  unsigned int entry_size;
  unsigned int entry_version;
  mmap_entry entries[0];
} mmap_tag;


typedef struct _multiboot2_ptrs_container {
  mmap_tag * mmap_tag_ptr;
} multiboot2_ptrs_container;


/* multiboot2.c */
void extract_multiboot2_tags_ptrs ( boot_data_t boot_data, multiboot2_ptrs_container tags_ptrs );

/* boot.c */
int boot ( unsigned int magic, unsigned int * info_ptr );


#endif
