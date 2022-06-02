#ifndef __LIBOS_PHYMEM_C__
#define __LIBOS_PHYMEM_C__ 1


#include "phymem.h"

#include "../../../boot/multiboot2/multiboot2.h"
#include "../../driver/vga/vga.h"

#include "../../../include/stdint.h"
#include "../../../include/stdlib.h"


void init_phymem ( boot_data_t boot_data ) {

  multiboot2_ptrs_container multiboot2_tags_ptrs;

  mmap_tag * mmap_tag_ptr;
  mmap_entry * mmap_entry_ptr;

  uint8_t ptr_str[19];


  extract_multiboot2_tags_ptrs(boot_data, multiboot2_tags_ptrs);
  mmap_tag_ptr = multiboot2_tags_ptrs.mmap_tag_ptr;


  for(
    mmap_entry_ptr = (mmap_entry *) mmap_tag_ptr->entries;
    (uint64_t) mmap_entry_ptr < (uint64_t) mmap_tag_ptr + mmap_tag_ptr->size;
    mmap_entry_ptr++
  ) {

    if ( phymem_alloc_blks == PHYMEM_MAP_SZ ) {
      kwrite("panic!");
      while(1){};
    }

    switch ( mmap_entry_ptr->type )  {

      case MULTIBOOT_MEMORY_AVAILABLE:
        phymem_map[ phymem_alloc_blks++ ] = (phymem_frame) {
          .addr = mmap_entry_ptr->addr,
          .size = mmap_entry_ptr->len,
          .status = PHYMEM_STATUS_FREE
        };
        break;

      default:
        phymem_map[ phymem_alloc_blks++ ] = (phymem_frame) {
          .addr = mmap_entry_ptr->addr,
          .size = mmap_entry_ptr->len,
          .status = PHYMEM_STATUS_RESERVED
        };
        break;

    }

  }


}


uint64_t * phymem_alloc ( uint64_t size ) {

  phymem_frame * phymem_frame_ptr;
  phymem_frame * phymem_frame_ptr_2;
  uint8_t ptr_str[19];

  phymem_frame new_frame;

  for (
    phymem_frame_ptr = (phymem_frame *) phymem_map;
    (uint64_t) phymem_frame_ptr < (uint64_t) (phymem_map + phymem_alloc_blks);
    phymem_frame_ptr++
  ) {

    if ( phymem_frame_ptr->status != PHYMEM_STATUS_FREE )
      continue;

    if ( size > phymem_frame_ptr->size )  /* Screw fragmentation yar har */
      continue;

    if ( size < phymem_frame_ptr->size )  {

      /* move all blks 1 position forward in phymem_map */
      for (
        phymem_frame_ptr_2 = (phymem_frame *) (phymem_map + phymem_alloc_blks);
        phymem_frame_ptr_2 > phymem_frame_ptr;
        phymem_frame_ptr_2--
      ) {

        * phymem_frame_ptr_2 = * (phymem_frame *) (phymem_frame_ptr_2 - 1);

      }

      /* update old free frame addr and size */
      ((phymem_frame *) phymem_frame_ptr + 1)->addr += size;
      ((phymem_frame *) phymem_frame_ptr + 1)->size -= size;

      /* set new frame data in phymem_map */
      * phymem_frame_ptr = (phymem_frame) {
        .addr = phymem_frame_ptr->addr,
        .size = size,
        .status = PHYMEM_STATUS_USED
      };

    }
    else { /* frame can only have same size, different sizes tested before */
      phymem_frame_ptr->status = PHYMEM_STATUS_USED;
    }

    phymem_alloc_blks++;
    return (uint64_t *) phymem_frame_ptr->addr;

  }

  return (uint64_t *) 0xffffffffffffffff;

}


void phymem_free ( uint64_t * addr ) {

  uint8_t ptr_str[19];

  for (
    phymem_frame * phymem_frame_ptr = (phymem_frame *) phymem_map;
    (uint64_t) phymem_frame_ptr < (uint64_t) (phymem_map + phymem_alloc_blks);
    phymem_frame_ptr++
  ) {

    if ( phymem_frame_ptr->addr != (uint64_t) addr )
      continue;

    phymem_frame_ptr->status = PHYMEM_STATUS_FREE;

    if ( phymem_frame_ptr == (phymem_frame *) phymem_map ) {

      if ( ((phymem_frame *) phymem_frame_ptr + 1)->status == PHYMEM_STATUS_FREE ) {

        ((phymem_frame *) phymem_frame_ptr + 1)->addr = phymem_frame_ptr->addr;
        ((phymem_frame *) phymem_frame_ptr + 1)->size += phymem_frame_ptr->size;

        for (
          phymem_frame * phymem_frame_ptr_2 = (phymem_frame *) phymem_frame_ptr;
          (uint64_t) phymem_frame_ptr_2 < (uint64_t) (phymem_map + phymem_alloc_blks) - 1;
          phymem_frame_ptr_2++
        ) {

          * phymem_frame_ptr_2 = * (phymem_frame_ptr_2 + 1);

        }

        phymem_alloc_blks--;

      }
      else  {

        phymem_frame_ptr->status = PHYMEM_STATUS_FREE;

      }

    }
    else if ( phymem_frame_ptr == (phymem_frame *) phymem_map + PHYMEM_MAP_SZ - 1 ) {

      if ( ((phymem_frame *) phymem_frame_ptr - 1)->status == PHYMEM_STATUS_FREE ) {

        ((phymem_frame *) phymem_frame_ptr - 1)->size += phymem_frame_ptr->size;
        phymem_alloc_blks--;

      }
      else {

        phymem_frame_ptr->status = PHYMEM_STATUS_FREE;

      }

    }
    else {

      if (
        ((phymem_frame *) phymem_frame_ptr - 1)->status != PHYMEM_STATUS_FREE
        && ((phymem_frame *) phymem_frame_ptr + 1)->status != PHYMEM_STATUS_FREE
      ) {

        phymem_frame_ptr->status = PHYMEM_STATUS_FREE;

      }
      else if (
        ((phymem_frame *) phymem_frame_ptr - 1)->status == PHYMEM_STATUS_FREE
      ) {

        ((phymem_frame *) phymem_frame_ptr - 1)->size += phymem_frame_ptr->size;

        for (
          phymem_frame * phymem_frame_ptr_2 = (phymem_frame *) phymem_frame_ptr;
          (uint64_t) phymem_frame_ptr_2 < (uint64_t) (phymem_map + phymem_alloc_blks) - 1;
          phymem_frame_ptr_2++
        ) {

          * phymem_frame_ptr_2 = * (phymem_frame_ptr_2 + 1);

        }

        phymem_alloc_blks--;

      }
      else {

        kwrite("birl!\n");

      }

    }

    return;

  }

}


void phymem_frame_pop ( phymem_frame * ptr, uint32_t index )  {

  ;

}


#endif
