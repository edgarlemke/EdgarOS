#ifndef __ISR_C__
#define __ISR_C__ 1

#include "../../libos/driver/vga/vga.h"


/*

Python to generate this:

s="""void isr_00_c () {

  char * msg = "isr_00\\n";
  kwrite(msg);

}

"""

for c in range(0x00,0x20):
  print(s.replace("isr_00","isr_0x%.2x"%c))

*/


void isr_0x00_c () {

  char * msg = "isr_0x00\n";
  kwrite(msg);

}


void isr_0x01_c () {

  char * msg = "isr_0x01\n";
  kwrite(msg);

}


void isr_0x02_c () {

  char * msg = "isr_0x02\n";
  kwrite(msg);

}


void isr_0x03_c () {

  char * msg = "isr_0x03\n";
  kwrite(msg);

}


void isr_0x04_c () {

  char * msg = "isr_0x04\n";
  kwrite(msg);

}


void isr_0x05_c () {

  char * msg = "isr_0x05\n";
  kwrite(msg);

}


void isr_0x06_c () {

  char * msg = "isr_0x06\n";
  kwrite(msg);

}


void isr_0x07_c () {

  char * msg = "isr_0x07\n";
  kwrite(msg);

}


void isr_0x08_c () {

  char * msg = "isr_0x08\n";
  kwrite(msg);

}


void isr_0x09_c () {

  char * msg = "isr_0x09\n";
  kwrite(msg);

}


void isr_0x0a_c () {

  char * msg = "isr_0x0a\n";
  kwrite(msg);

}


void isr_0x0b_c () {

  char * msg = "isr_0x0b\n";
  kwrite(msg);

}


void isr_0x0c_c () {

  char * msg = "isr_0x0c\n";
  kwrite(msg);

}


void isr_0x0d_c () {

  char * msg = "isr_0x0d\n";
  kwrite(msg);

}


void isr_0x0e_c () {

  char * msg = "isr_0x0e\n";
  kwrite(msg);

}


void isr_0x0f_c () {

  char * msg = "isr_0x0f\n";
  kwrite(msg);

}


void isr_0x10_c () {

  char * msg = "isr_0x10\n";
  kwrite(msg);

}


void isr_0x11_c () {

  char * msg = "isr_0x11\n";
  kwrite(msg);

}


void isr_0x12_c () {

  char * msg = "isr_0x12\n";
  kwrite(msg);

}


void isr_0x13_c () {

  char * msg = "isr_0x13\n";
  kwrite(msg);

}


void isr_0x14_c () {

  char * msg = "isr_0x14\n";
  kwrite(msg);

}


void isr_0x15_c () {

  char * msg = "isr_0x15\n";
  kwrite(msg);

}


void isr_0x16_c () {

  char * msg = "isr_0x16\n";
  kwrite(msg);

}


void isr_0x17_c () {

  char * msg = "isr_0x17\n";
  kwrite(msg);

}


void isr_0x18_c () {

  char * msg = "isr_0x18\n";
  kwrite(msg);

}


void isr_0x19_c () {

  char * msg = "isr_0x19\n";
  kwrite(msg);

}


void isr_0x1a_c () {

  char * msg = "isr_0x1a\n";
  kwrite(msg);

}


void isr_0x1b_c () {

  char * msg = "isr_0x1b\n";
  kwrite(msg);

}


void isr_0x1c_c () {

  char * msg = "isr_0x1c\n";
  kwrite(msg);

}


void isr_0x1d_c () {

  char * msg = "isr_0x1d\n";
  kwrite(msg);

}


void isr_0x1e_c () {

  char * msg = "isr_0x1e\n";
  kwrite(msg);

}


void isr_0x1f_c () {

  char * msg = "isr_0x1f\n";
  kwrite(msg);

}


#endif