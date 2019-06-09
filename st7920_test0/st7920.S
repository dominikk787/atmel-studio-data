
/*
 * st7920.S
 *
 * Created: 2019-05-24 18:51:26
 *  Author: programowanie
 */ 

#ifndef __ASSEMBLER__
 #define __ASSEMBLER__
#endif

#include <avr/io.h>
#include "config.h"

#define        preg_1                  r24
#define        preg_2                  r22

#define set_en_low             cbi             _SFR_IO_ADDR(HW_LCD_EN_PORT), HW_LCD_EN_PIN
#define set_en_high            sbi             _SFR_IO_ADDR(HW_LCD_EN_PORT), HW_LCD_EN_PIN
#define set_en_output          sbi             (_SFR_IO_ADDR(HW_LCD_EN_PORT) - 1), HW_LCD_EN_PIN
#define set_en_input           cbi             (_SFR_IO_ADDR(HW_LCD_EN_PORT) - 1), HW_LCD_EN_PIN

#define set_b0_low       cbi       _SFR_IO_ADDR(HW_LCD_B0_PORT), HW_LCD_B0_PIN
#define set_b0_high      sbi       _SFR_IO_ADDR(HW_LCD_B0_PORT), HW_LCD_B0_PIN
#define set_b0_output          sbi             (_SFR_IO_ADDR(HW_LCD_B0_PORT) - 1), HW_LCD_B0_PIN
#define set_b0_input           cbi             (_SFR_IO_ADDR(HW_LCD_B0_PORT) - 1), HW_LCD_B0_PIN

#define RCALL rcall

.global lcdwrite
.global lcdread
.global wait5s
.global wait4s
.global wait3s
.global wait2s
.global wait1s
.global wait500ms
.global wait400ms
.global wait300ms
.global wait200ms
.global wait100ms
.global wait50ms
.global wait40ms
.global wait30ms
.global wait20ms
.global wait10ms
.global wait5ms
.global wait4ms
.global wait3ms
.global wait2ms
.global wait1ms
.global wait500us
.global wait400us
.global wait300us
.global wait200us
.global wait100us
.global wait50us
.global wait40us
.global wait30us
.global wait20us
.global wait10us
.global wait5us
.global wait4us
.global wait3us
.global wait2us
.global wait1us

.func lcdwrite

lcdwrite:
; 1-bit interface for ST7920 controller
	set_b0_high
	set_b0_output		; enable output mode
	set_en_low
	set_en_output		; enable output mode

	RCALL	toggle_en	; set en high and low

        RCALL	four_bits	; output four times 1 
	set_b0_low		; write mode
	RCALL	toggle_en	; set en high and low

	sbrc    preg_1, 0
	set_b0_high		; data mode
	sbrs    preg_1, 0
	set_b0_low		; instruction mode
	RCALL	toggle_en	; set en high and low

	set_b0_low
	RCALL	toggle_en	; set en high and low
				; first 8 bit transfer finished
  ; output highest bit first
        sbrc    preg_2, 7
	 set_b0_high		; bit 7 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
        sbrc    preg_2, 6
	 set_b0_high		; bit 6 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
        sbrc    preg_2, 5
	 set_b0_high		; bit 5 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
        sbrc    preg_2, 4
	 set_b0_high		; bit 4 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
	RCALL	four_bits	; output 4 times 0
				; the upper 4-bit are followed by 4 x 0
	set_b0_low
        sbrc    preg_2, 3
	 set_b0_high		; bit 3 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
        sbrc    preg_2, 2
	 set_b0_high		; bit 2 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
        sbrc    preg_2, 1
	 set_b0_high		; bit 1 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
        sbrc    preg_2, 0
	 set_b0_high		; bit 0 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
	RCALL	four_bits	; output 4 times 0
				; the lower 4-bit are followed by 4 x 0
	RCALL	wait50us
	RCALL	wait30us	; at least 72 us delay
	ret		// return _lcd_hw_write
	.endfunc

.func lcdread

lcdread:
; 1-bit interface for ST7920 controller
	set_b0_high
	set_b0_output		; enable output mode
	set_en_low
	set_en_output		; enable output mode

	RCALL	toggle_en	; set en high and low

    RCALL	four_bits	; output four times 1 
	set_b0_high		; write mode
	RCALL	toggle_en	; set en high and low

	sbrc    preg_1, 0
	set_b0_high		; data mode
	sbrs    preg_1, 0
	set_b0_low		; instruction mode
	RCALL	toggle_en	; set en high and low

	set_b0_low
	RCALL	toggle_en	; set en high and low
				; first 8 bit transfer finished
  ; output highest bit first
        sbrc    preg_2, 7
	 set_b0_high		; bit 7 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
        sbrc    preg_2, 6
	 set_b0_high		; bit 6 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
        sbrc    preg_2, 5
	 set_b0_high		; bit 5 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
        sbrc    preg_2, 4
	 set_b0_high		; bit 4 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
	RCALL	four_bits	; output 4 times 0
				; the upper 4-bit are followed by 4 x 0
	set_b0_low
        sbrc    preg_2, 3
	 set_b0_high		; bit 3 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
        sbrc    preg_2, 2
	 set_b0_high		; bit 2 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
        sbrc    preg_2, 1
	 set_b0_high		; bit 1 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
        sbrc    preg_2, 0
	 set_b0_high		; bit 0 == 1
	RCALL	toggle_en	; set en high and low

	set_b0_low
	RCALL	four_bits	; output 4 times 0
				; the lower 4-bit are followed by 4 x 0
	RCALL	wait50us
	RCALL	wait30us	; at least 72 us delay
	ret		// return _lcd_hw_write
	.endfunc


/* output 4 times the same bit */
four_bits:
	RCALL toggle_en
	RCALL toggle_en
	RCALL toggle_en
	RCALL toggle_en
	ret

toggle_en:
	set_en_high              ;force data read from LCD controller
        set_en_high		; hold en high to meet the specification (300ns)
	set_en_low		; set SCLK back to low
	ret

wait5s:
 rcall wait1s		;	12+x return-adresses
wait4s:
 rcall wait1s		;	12+x return-adresses
wait3s:
 rcall wait1s		;	12+x return-adresses
wait2s:
 rcall wait1s		;1s     12+x Return-Adresses
wait1s:
wait1000ms:	
 rcall wait500ms	;500ms	11+x Return-Adresses
wait500ms:
 rcall wait100ms	;100ms	10+x Return-Adresses
wait400ms:
 rcall wait100ms	;100ms	10+x Return-Adresses
wait300ms:
 rcall wait100ms	;100ms	10+x Return-Adresses
wait200ms:
 rcall wait100ms	;100ms	10+x Return-Adresses
wait100ms:
 rcall wait50ms	    	; 50ms	9+x Return-Adresses
wait50ms:
 rcall wait10ms	    	;10ms	8+x Return-Adresses 
wait40ms:
 rcall wait10ms	    	;10ms	8+x Return-Adresses  
wait30ms:
 rcall wait10ms	    	;10ms	8+x Return-Adresses  
wait20ms:
 rcall wait10ms	    	;10ms	8+x Return-Adresses
wait10ms:
 rcall wait5ms	   	;5ms	7+x Return-Adresses
wait5ms:
 rcall wait1ms	   	;1ms	6+x Return-Adresses
wait4ms:
 rcall wait1ms	   	;1ms	6+x Return-Adresses
wait3ms:
 rcall wait1ms	   	;1ms	6+x Return-Adresses
wait2ms:
 rcall wait1ms	   	;1ms	6+x Return-Adresses
wait1ms:
 rcall wait500us    	;500us	5+x Return-Adresses
wait500us:
 rcall wait100us    	;100us	4+x Return-Adresses
wait400us:
 rcall wait100us    	;100us	4+x Return-Adresses
wait300us:
 rcall wait100us    	;100us	4+x Return-Adresses
wait200us:
 rcall wait100us    	;100us	4+x Return-Adresses
wait100us:
 rcall wait50us	
wait50us:
 rcall wait10us     	;10us delay
wait40us:
 rcall wait10us     	;10us delay
wait30us:
 rcall wait10us     	;10us delay
wait20us:
 rcall wait10us		;10us delay
wait10us:		;
 rcall wait5us
  ; a 1us delay is also possible
wait5us:
   rcall wait1us
wait4us:
   rcall wait1us
wait3us:
   rcall wait1us
wait2us:
   rcall wait1us
wait1us:
    nop			/* one additional tic */
 ret