/*
 * st7920_test0.c
 *
 * Created: 2019-05-24 18:49:06
 * Author : programowanie
 */ 

#include <avr/io.h>
#include "st7920.h"
#include "st7920g.h"

int main(void)
{
    wait100ms();
	lcdwrite(0,CMD_SET_FUNCTION | MODE_8_BIT);
	wait200us();
	lcdwrite(0,CMD_SET_FUNCTION | MODE_8_BIT);
	wait50us();
	lcdwrite(0,CMD_DISPLAY_ON);
	wait200us();
	lcdwrite(0,CMD_CLEAR);
	wait20ms();
	lcdwrite(0,CMD_SET_ENTRY_MODE);
	wait1ms();
	lcdwrite(0,CMD_SET_FUNCTION | MODE_8_BIT | MODE_EXTENDED);
	wait100us();
	lcdwrite(0,CMD_SET_FUNCTION | MODE_8_BIT | MODE_EXTENDED | GRAPHIC_DISPLAY_ON);
	wait50ms();
	lcd_test(0);
	lcd_refresh();
	wait5s();
	lcd_clear();
	lcd_refresh();
	wait100ms();
	uint8_t str[] = "ST7920 test";
	for(uint8_t i = 0; str[i]; i++) lcd_data(str[i]);
	wait50ms();
	lcd_refresh();
    while (1) ;
}

