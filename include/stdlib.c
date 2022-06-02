#ifndef __INCLUDE_STDLIB_C__
#define __INCLUDE_STDLIB_C__ 1


#include "stdlib.h"

#include "../libos/driver/vga/vga.h"


void itoa ( unsigned long int src, char * dest, unsigned char base )  {

  char * hex_buffer = "0x0000000000000000";

  char next = 0;

  switch( base )  {
    case 16:

      for(unsigned int i = 17; i >= 2; i--)  {

        next = src % 16;
        if (next >= 0 && next <=9)  {
          hex_buffer[i] = ( 48 + next );
        }
        else if(next >= 0x0a && next <= 0x0f) {
          hex_buffer[i] = ( 97 + next - 0x0a );
        }

        src = src >> 4;

      }

      for (unsigned int i = 0; i < 19; i++)  {
        dest[i] = hex_buffer[i];
      }

      break;

    default:
      break;
  }


}


#endif
