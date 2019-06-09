

//defines
#include <avr/io.h>
#include <avr/wdt.h>

//----------------------------------------
void WdtSet(char presc)
{
	wdt_reset();		
	WDTCR |= (1<<WDCE | 1<<WDE);
	WDTCR = (1<<WDE | presc); 
}


//----------------------------------------
void WdtReset(void)
{
	wdt_reset();		
}

//----------------------------------------
void WdtStop(void)
{
	wdt_reset();		
	WDTCR |= (1<<WDCE | 1<<WDE);
	WDTCR = 0; 
}
