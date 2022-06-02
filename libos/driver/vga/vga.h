#ifndef __BOOTSTRAP_VGA_H__
#define __BOOTSTRAP_VGA_H__ 1


#include "../../../include/stdint.h"


#define BLACK        0
#define BLUE         1
#define GREEN        2
#define CYAN         3
#define RED          4
#define MAGENTA      5
#define BROWN        6
#define LIGHT_GREY   7
#define DARK_GREY    8
#define LIGHT_BLUE   9
#define LIGHT_GREEN 10
#define LIGHT_CYAN  11
#define LIGHT_RED   12
#define PINK        13
#define YELLOW      14
#define WHITE       15

#define DEFAULT_BG BLACK
#define DEFAULT_FG YELLOW


void kputc ( uint8_t char_, uint32_t pos, uint8_t bg_color, uint8_t fg_color );
void kcls ( void );
void kcwrite(uint8_t * str, uint8_t bg_color, uint8_t fg_color);
void kwrite(uint8_t * str);
void kinitvga ( void ) ;

#endif
