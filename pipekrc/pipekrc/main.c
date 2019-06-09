/*
 * pipekrc.c
 *
 * Created: 2018-06-21 12:09:28
 * Author : programowanie
 */ 

#define F_CPU 600000UL

#include <avr/io.h>
#include <inttypes.h>
#include <avr/interrupt.h>

#define beep() PORTB |= 1<<PORTB3
#define noBeep() PORTB &= ~(1<<PORTB3)

uint64_t _millis = 0;
uint16_t _1000us = 0;

uint64_t millis(void);
uint64_t micros(void);
uint64_t pulseIn(uint8_t,uint8_t);
uint64_t waitForState(uint8_t,uint8_t);

int main(void)
{
	CLKPR=0b10000000;
	CLKPR |= 0b00000011;
    DDRB |= 1<<DDB3;
	TCCR0B |= (1<<CS01) + (1<<CS00);
	TIMSK0  |= 1<<TOIE0;
	PRR |= 1<<PRADC;
	MCUCR &= ~((1<<SE) + (1<<SM1) + (1<<SM0));
	
    while (1) 
    {
		static uint8_t beep=0;
		if(pulseIn(4,1)>1500) beep=1;
		else {
			beep=0;
			noBeep();
		}
		static uint64_t time=0;
		if((time<millis())&(beep==1)) {
			if(((PINB>>4)&1)==1) noBeep();
			else beep();
		}
    }
}

ISR(TIM0_OVF_vect) {
	_1000us += 13;
	while (_1000us > 1000) {
		_millis++;
		_1000us -= 1000;
	}
}

uint64_t millis() {
	uint64_t m;
	cli();
	m = _millis;
	sei();
	return m;
}

uint64_t micros() {
	uint16_t u;
	uint64_t m;
	cli();
	u = _1000us;
	m = _millis;
	sei();
	return (m*1000)+u;
}

uint64_t pulseIn(uint8_t pin, uint8_t state) {
	uint64_t starttime=waitForState(pin,state);
	if(state==1) state=0;
	else state=1;
	uint64_t stoptime=waitForState(pin,state);
	return stoptime-starttime;
}

uint64_t waitForState(uint8_t pin, uint8_t state) {
	while(((PINB>>pin)&1)!=state) ;
	return micros();
}