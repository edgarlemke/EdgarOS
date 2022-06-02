#ifndef __LIBOS_PHYMEM_H__
#define __LIBOS_PHYMEM_H__ 1


#include "../../../arch/x86_64/kernel.h"


typedef struct _phymem_frame {
  unsigned long int addr;
  unsigned long int size;
  unsigned char status;
} phymem_frame;

void phymem_frame_pop ( phymem_frame * ptr, unsigned int index );

#define PHYMEM_STATUS_FREE 0xfa
#define PHYMEM_STATUS_RESERVED 0xeb
#define PHYMEM_STATUS_USED 0xdc


#define PHYMEM_MAP_SZ 32
static phymem_frame phymem_map[ PHYMEM_MAP_SZ ];
static unsigned int phymem_alloc_blks = 0;


void init_phymem ( boot_data_t boot_data );
unsigned long int * phymem_alloc ( unsigned long int size );
void phymem_free ( unsigned long int * addr );


#endif
