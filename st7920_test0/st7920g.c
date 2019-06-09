/*
 * st7920.c
 *
 * Created: 2019-06-07 16:09:50
 *  Author: programowanie
 */ 

#include <stdio.h>
#include <avr/pgmspace.h>
#include "font.h"
#include "st7920g.h"
#include "st7920.h"

uint8_t lcd_bit_mem[64][128 / 8];
uint8_t _xpos = 1;
uint8_t _vpos = 1;

void lcd_clear(void) {
	for(uint8_t y = 0; y < 64; y++) {
		for(uint8_t x = 0; x < 16; x++)
			lcd_bit_mem[y][x] = 0;
	}
}

void lcd_test(uint8_t n) {
	for(uint8_t y = 0; y < 64; y++) {
		for(uint8_t x = 0; x < 16; x++){
			switch(n) {
				case 0:
					lcd_bit_mem[y][x] = x + (y / 4) + 1;
					break;
				case 1:
					
					break;
				case 2:
					
					break;
				case 3:
					
					break;
			}
		}
	}
}

void lcd_set_pixels(const uint8_t *pdata, uint8_t x, uint8_t y) {
	uint8_t ii,hmsk;
	uint8_t jj;
	uint8_t xx,xxbit;
	uint8_t ymem;
	if (((x+6) > 128) || ((y+8) > 64)) return;
	for (ii=0; ii<8; ii++) {
		hmsk = (1 << ii);
		for (jj=0; jj<6; jj++) {
			xx = (x + jj) / 8;
			xxbit = (x + jj) % 8;
			ymem = y + ii;
			if ((pgm_read_byte(pdata + jj) & hmsk) == 0) {
				// clear bit in the pixel image
				lcd_bit_mem[ymem][xx] &= ~(1 << (7-xxbit));
			} else {
				// set bit in the pixel image
				lcd_bit_mem[ymem][xx] |= (1 << (7-xxbit));
			}
		} /* end for jj */
	} /* end for ii */
}

void mylcd_set_pixels(const uint8_t *pdata, uint8_t x, uint8_t y) {
	for(uint8_t by = 0; by < 8; by++) {
		
	}
}

void lcd_data(uint8_t temp1) {
	/* -------------------------------------------------------------------------- */
	uint8_t *pfont;
	pfont = (uint8_t *)font + (6 * temp1);	// first byte of character data
	// for other controllers like ST7565 the _page specifies the page of the controller (8 lines)
	lcd_set_pixels( pfont, _xpos, _vpos);
	_xpos += 6;		// move pointer to the next character position
} /* end lcd_data() */

void lcd_refresh(void) {
	uint8_t xx;
	uint8_t yy;
	for (yy=0; yy<64; yy++) {
		if (yy < 32) {
			lcdwrite(0, CMD_SET_GDRAM_ADDRESS|yy);	/* set vertical start address */
			lcdwrite(0, CMD_SET_GDRAM_ADDRESS|0);	/* horizontal address starts with 0 */
		} else {
			// the second half of display is located at GDRAM address 128..255 ((8..15) x 16 pixel)
			lcdwrite(0, CMD_SET_GDRAM_ADDRESS|(yy-32));	/* set vertical start address */
			lcdwrite(0, CMD_SET_GDRAM_ADDRESS|8);	/* horizontal address starts with 0 (128)*/
		}
		for (xx=0; xx<16; xx++) {
			lcdwrite(1, lcd_bit_mem[yy][xx]);	// write 16 x 8 bits to GDRAM (= 128 pixel)
		}
	} /* end for yy */
}