#ifndef __BOOTSTRAP_VGA_C_
#define __BOOTSTRAP_VGA_C_ 1

#include "vga.h"

uint32_t cursor_pos;
uint32_t ln;
uint32_t col;


void kputc(uint8_t char_, uint32_t pos, uint8_t bg_color, uint8_t fg_color){
  uint8_t * char_pos = (uint8_t *) 0xb8000 + (pos*2);
  uint8_t * color_pos = char_pos + 1;

  * char_pos = char_;
  * color_pos = fg_color | bg_color << 4;
}

void kcls(void){
 for( uint32_t i=0; i <= 2001 ;i++ )
   kputc(0,i,DEFAULT_BG,DEFAULT_FG);
}

void kcwrite(uint8_t * str, uint8_t bg_color, uint8_t fg_color){

  while(*str){
    uint8_t uint8_t_ = *str++;

    /* end of string uint8_t */
    if( uint8_t_ == '\0' )
      break;

    /* break line */
    if( uint8_t_ == '\n' ){

      /* if ln is lesser than 25, we're not at the last line,
         so it's ok to increment the line counter */
      if (ln < 25) {
        ln++;
      }
      else {
        ln = 0;
      }

      cursor_pos = 80 * ln;
      col = 0;
      continue;

    }

    /* if col is 80 the next uint8_t will necessarily show in
       the next line */
    if(col == 80)
      ln++;
    col = cursor_pos % 80;

    kputc( uint8_t_, cursor_pos++, bg_color, fg_color );
  }
}

void kwrite(uint8_t * str){
  kcwrite(str, DEFAULT_BG, DEFAULT_FG);
}

void kinitvga(void){
  cursor_pos = 0;
  ln = 0;
  col = 0;

  kcls();
}

#endif
