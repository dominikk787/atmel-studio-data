/*
 * startboot.h
 *
 * Created: 2019-04-15 16:11:32
 *  Author: programowanie
 */ 


#ifndef STARTBOOT_H_
#define STARTBOOT_H_

#define STARTBOOT_PORTR PORTB
#define STARTBOOT_PINR PINB
#define STARTBOOT_PIN PB1

void __attribute__ ((naked)) __attribute__ ((section (".init8"))) startboot(void);

void startboot(void) {
	cli();
	asm("wdr");
	MCUSR &= ~(1<<WDRF);
	WDTCSR |= (1<<WDCE) | (1<<WDE);
	WDTCSR = 0x00;
	STARTBOOT_PORTR |= _BV(STARTBOOT_PIN);
	if(!(STARTBOOT_PINR & _BV(STARTBOOT_PIN))) {
		STARTBOOT_PORTR &= ~_BV(STARTBOOT_PIN);
		asm("ldi r30, 0x6F");
		asm("ldi r31, 3");
		asm("ijmp");
	}
	STARTBOOT_PORTR &= ~_BV(STARTBOOT_PIN);
}



#endif /* STARTBOOT_H_ */