/*
 * micro_ladownik.c
 *
 * Created: 2016-08-31 11:56:17
 *  Author: dsosnowski
 */ 


#define F_CPU 8000000UL
#include <avr/io.h>
#include <avr/interrupt.h>
#include <inttypes.h>
#include <util/delay.h>
#include <avr/wdt.h>
#include <avr/sleep.h>
#include <avr/pgmspace.h>
#include "defs.h"
#include "wdog.h"


void HardInit(void);
void PowerInit(void);
void AnalogInit(void);


#define POWER_PERIOD		85
#define MIN_PWM				2
#define ANALOG_PERIOD		200
#define DEFAULT_PAUSE		150


#define MAIN_DELAY			10
#define LED_PERIOD			200
#define LED_BLINK			10
#define AKU_FULL			900		//0,02A / adc point

struct {
	char level;
	char period;
	volatile char pause;
} pwr;

struct {
	uint16_t reg;
	uint16_t aku;
	char level;
} param;

struct {
	char led;
	char ledstate;
	volatile char pwrsync;
} system;


int main(void)
{
	uint16_t reg16;
	char val;
	
	HardInit();
	WdtSet(7);
	AnalogInit();
	
	for (val = 0;val < 3; val++){
		LED_SET;
		_delay_ms(200);
		LED_OFF;
		_delay_ms(200);
	}
	PowerInit();
	
	pwr.pause = 0xFF;
	
    while(1)
    {
		reg16 = param.aku;
		
		if (reg16 >= AKU_FULL) {
			pwr.level = 0;
		} else {
			reg16 = param.reg;
			reg16 >>= 2;
			val = reg16;
			val = ~(val);
			val /= 3;	
			pwr.level = val;
		}
				
		if (system.led < LED_PERIOD) {
			system.led++;
		}

		if (system.pwrsync > 0)	{
			system.pwrsync = 0;
			system.led = 0;
		}
		
		if (system.led == 0) LED_SET;
		
		if (param.aku > (AKU_FULL - LED_PERIOD)){
			reg16 = param.aku;
			reg16 -= (AKU_FULL - LED_PERIOD);
			if (reg16 > LED_PERIOD) reg16 = LED_PERIOD;
			if (reg16 < LED_BLINK) reg16 = LED_BLINK;	
			system.ledstate = reg16;
		} else {
			system.ledstate = LED_BLINK;
		}
		
		if (system.led > system.ledstate) LED_OFF;
		
		_delay_ms(MAIN_DELAY);
		WdtReset();
    }
}

//--------------------------------------------------------------
void HardInit(void)
{
	PORTB = (1<<LED_PIN);
	DDRB = (1<<LED_PIN | 1<<DRV_PIN);
}

//--------------------------------------------------------------
void PowerInit(void)
{
	OCR1C = POWER_PERIOD;
	OCR1A = 0;

	TCCR1 = (1<<CTC1 | 1<<CS13 | 1<<CS11 | 1<<CS10);
	TIMSK = (1<<OCIE1A | 1<<TOIE1);
	
	PCMSK = (1<<PCINT1);
	GIMSK |= (1<<PCIE);
	
	pwr.level = 0;
	sei();
}

//----------------------------------
void AnalogInit(void)
{
	//DIDR0 = (1<<ADC2D | 1<<ADC3D);
	ADCSRA = (1<<ADEN | 1<<ADPS2 | 1<<ADPS1 | 1<<ADPS0);
	ADMUX = (REG_CH);
	ADCSRA |= (1<<ADSC);
}

//--------------------------------------------------------------
ISR(TIM1_COMPA_vect)
{
	DRV_OFF;
}

//--------------------------------------------------------------
ISR (TIM1_OVF_vect)
{
	DRV_OFF;
	TCNT1 = 0;
	TIFR = (1<<OCF1A | 1<<TOV1);
}

//--------------------------------------------------------------
ISR (PCINT0_vect)
{
	static char i;
	
	if ((SYNC_IN & (1<<SYNC_PIN)) == 0)
	{
		if (TCNT1 > 70) {
			TCNT1 = 0;
			OCR1A = pwr.level;
			
			i++;
			if (i > ANALOG_PERIOD) {
				i = 0;
				pwr.pause = 1;
				system.pwrsync = 1;
				ADMUX = (VAKU_CH);
			} else {
				ADMUX = (REG_CH);
			}
			
			if ((VAKU_IN & (1<<VAKU_PIN)) == 0) pwr.pause = DEFAULT_PAUSE;
			
			if (pwr.pause > 0) {
				DRV_OFF;
				pwr.pause--;	
			} else {				
				if (OCR1A > MIN_PWM)
					DRV_SET;
				else DRV_OFF;
			}
	
			if (i == 1) {
				param.aku = ADC;
			} else {
				param.reg = ADC;
			}		
			ADCSRA |= (1<<ADSC);		
			
			TIFR = (1<<OCF1A | 1<<TOV1);
		}
	}
}
