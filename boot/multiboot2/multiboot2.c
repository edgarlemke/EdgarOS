#ifndef __BOOT_MULTIBOOT2_MULTIBOOT2_C__
#define __BOOT_MULTIBOOT2_MULTIBOOT2_C__ 1


#include "multiboot2.h"

#include "../../include/stdint.h"
#include "../../libos/driver/vga/vga.h"


void extract_multiboot2_tags_ptrs ( boot_data_t boot_data, multiboot2_ptrs_container tags_ptrs ) {

 uint32_t * ptr = boot_data.multiboot2_info_ptr;

 uint32_t total_size;
// uint32_t reserved;

 uint32_t tag_type;
 uint32_t tag_size;
 char found = 0;

 total_size = * ptr;
// reserved = * (ptr + 1);

 for ( uint32_t i = 2; i < total_size; i++ ) {

   tag_type = *(ptr+i);
   tag_size = *(ptr+i+1);

   if ( tag_size == 0 )
     continue;

   switch ( tag_type ) {

     case MULTIBOOT_TAG_TYPE_MMAP :
       /* break if entry_size isn't multiple of 8 */
       if( *(ptr+i+2) % 8 != 0 )
         break;

       /* break if entry_version isn't 0 */
       if( *(ptr+i+3) != 0 )
         break;

       tags_ptrs.mmap_tag_ptr = (mmap_tag *) (ptr+i);

       found = 1;
       break;

     /* skip non-matching tag types */
     default:
       continue;

   }

   if ( found ) {
     i += tag_size/4;
   }

  }

}


#endif
