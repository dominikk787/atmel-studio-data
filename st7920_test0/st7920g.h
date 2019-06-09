/*
 * st7920g.h
 *
 * Created: 2019-06-07 16:47:59
 *  Author: programowanie
 */ 


#ifndef ST7920G_H_
#define ST7920G_H_

#define CMD_CLEAR	0x01		/* clear display, basic Instruction */
#define CMD_CGRAM_SELECT 0x02		/* SR=0, enable CGRAM address */
#define CMD_SET_ENTRY_MODE 0x04		/* set cursor posistion and shift for read/write */
#define MODE_RIGHT_MOVE 0x02
#define CMD_DISPLAY_CONTROL	0x08	/* display control, basic Instruction */
#define DISPLAY_ON 0x4
#define CURSOR_ON 0x02
#define BLINK_ON 0x01
#define CMD_DISPLAY_ON	(CMD_DISPLAY_CONTROL | DISPLAY_ON)
#define CMD_DISPLAY_OFF	CMD_DISPLAY_CONTROL
#define CMD_SET_FUNCTION 0x20		/* basic + extended Instruction */
#define MODE_8_BIT 0x10		/* Bit 4 is 8 bit mode */
#define MODE_EXTENDED 0x04		/* Bit 2 is used for extended Intruction */
#define GRAPHIC_DISPLAY_ON 0x02	/* Bit 1 is used for graphic display on, only extended Instruction */
#define CMD_SET_GDRAM_ADDRESS 0x80	/* set graphic display RAM address ,extended Instruction */

void lcd_set_pixels(const uint8_t *pdata, uint8_t x, uint8_t y) ;
void lcd_data(uint8_t temp1) ;
void lcd_refresh(void) ;
void lcd_clear(void) ;
void lcd_test(uint8_t n);

#endif /* ST7920G_H_ */