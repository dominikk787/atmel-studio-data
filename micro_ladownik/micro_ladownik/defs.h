/*
 * defs.h
 *
 * Created: 2016-08-31 12:00:23
 *  Author: dsosnowski
 */ 


#ifndef DEFS_H_
#define DEFS_H_

#define LED_PORT			PORTB
#define LED_DDR				DDRB
#define LED_PIN				2
#define LED_SET				(LED_PORT |= (1<<LED_PIN))
#define LED_OFF				(LED_PORT &= ~(1<<LED_PIN))

#define SYNC_PORT			PORTB
#define SYNC_IN				PINB
#define SYNC_PIN			1

#define DRV_PORT			PORTB
#define DRV_DDR				DDRB
#define DRV_PIN				0
#define DRV_SET				(DRV_PORT |= (1<<DRV_PIN))
#define DRV_OFF				(DRV_PORT &= ~(1<<DRV_PIN))

#define REG_PIN				3		//ADC3
#define REG_CH				3

#define VAKU_IN				PINB
#define VAKU_PIN			4		//ADC2
#define VAKU_CH				2	



#endif /* DEFS_H_ */