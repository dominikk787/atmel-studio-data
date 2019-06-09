/*
 * test0.c
 *
 * Created: 2019-04-08 08:27:29
 * Author : programowanie
 */ 

#include <avr/io.h>
#include <util/delay.h>
#include <avr/interrupt.h>
#include "1wire.h"
#include "startboot.h"

#define DISPNUM 3

#define ocrup 3
#define ocrdown 18

#define tdown 480
#define tup 650
#define tmedium 550

volatile uint16_t beepc = 0xffff;
volatile uint8_t beepe = 0;

uint8_t leddata[DISPNUM];

uint8_t lednumbers[] = {
	0b01111111,
	0b00001110,
	0b10110111,
	0b10011111,
	0b11001110,
	0b11011011,
	0b11111011,
	0b00001111,
	0b11111111,
	0b11011111
};

void dispnum(uint16_t val);

int main(void)
{
	DDRB = 0b11111101;
	DDRA |= 0b10;
	DDRD |= 0b0011100;
	PORTD = 0;
	TCCR1A |= _BV(WGM10);
	TCCR1B |= _BV(WGM12) | _BV(CS11) | _BV(ICNC1) | _BV(ICES1);
	TIMSK |= _BV(TOIE1) | _BV(ICIE1);
	TCCR0A |= _BV(COM0B0) | _BV(WGM01);
	TCCR0B |= _BV(CS02);
	sei();
    /* Replace with your application code */
    while (1) 
    {
		uint16_t temp = ds18b20ReadTemp();
		static uint16_t oldtemp = 0;
		static uint16_t avtemp = 0;
		static uint8_t avtempc = 0;
		avtemp += temp % 1000;
		if(avtempc == 15) {
			dispnum(avtemp >> 4);
			avtemp = 0;
			avtempc = -1;
		}
		avtempc++;
		if(temp == 2000) {
			beepe = 1;
			if(beepc == 0xffff) beepc = 0;
			DDRD |= _BV(DDD5);
			OCR0A = ocrup;
			continue;
		}
		if(((oldtemp < tmedium) ^ (temp < tmedium)) | ((oldtemp > tmedium) ^ (temp > tmedium))) {
			beepe = 1;
		}
		oldtemp = temp;
		if(temp <= tdown) {
			if(beepe) {
				if(beepc == 0xffff) {
					beepc = 0;
					DDRD |= _BV(DDD5);
					OCR0A = ocrdown;
				}
			}
		} else if(temp >= tup) {
			if(beepe) {
				if(beepc == 0xffff) {
					beepc = 0;
					DDRD |= _BV(DDD5);
					OCR0A = ocrup;
				}
			}
		} else if((temp < (tup - 10)) && (temp > (tdown + 10))){
			beepc = 0xffff;
		}
    }
}

void dispnum(uint16_t val) {
	uint8_t d[3];
	d[0] = val / 100;
	d[1] = (val / 10) % 10;
	d[2] = val % 10;
	leddata[0] = lednumbers[d[0]];
	leddata[1] = lednumbers[d[1]];
	leddata[2] = lednumbers[d[2]];
}

ISR(TIMER1_OVF_vect) {
	 static uint8_t dnumber = 0;
	 PORTD &= 0b1100011;
	 PORTB = ~leddata[dnumber];
	 PORTA &= 0b101;
	 PORTA |= (dnumber != 1 ? 0b10 : 0);
	 PORTD |= _BV(4-dnumber);
	 dnumber++;
	 dnumber %= DISPNUM;
	 
	 if(beepe) { 
		 if(beepc == 800) {
			 DDRD ^= _BV(DDD5);
			 beepc = 0;
		 }else if(beepc == 0xffff) DDRD &= ~_BV(DDD5);
		 if(beepc < 0xffff) beepc++;
	 }else {
		 DDRD &= ~_BV(DDD5);
		 beepc = 0xffff;
	 }
}

ISR(TIMER1_CAPT_vect) {
	beepe = 0;
}