/*
 * bootloader0.c
 *
 * Created: 2019-04-14 14:44:42
 * Author : programowanie
 */ 

#include <avr/io.h>
#include <avr/boot.h>

typedef uint8_t pagelen_t; //page 16w 32bytes 64pages

typedef union {
	uint8_t  *bptr;
	uint16_t *wptr;
	uint16_t word;
	uint8_t bytes[2];
} addr16_t;

void __attribute__ ((section (".bootloader"))) startboot(void);
void __attribute__((__noreturn__)) __attribute__ ((section (".bootloader"))) bootloader(void);
void __attribute__ ((section (".bootloader"))) putch(char ch);
uint8_t __attribute__ ((section (".bootloader"))) getch(void);
void __attribute__ ((section (".bootloader"))) verifySpace();
static __attribute__((always_inline)) void writebuffer(addr16_t mybuff, addr16_t address, pagelen_t len);
static __attribute__((always_inline)) void read_mem(addr16_t address, pagelen_t length);

int main(void)
{
	bootloader();
    /* Replace with your application code */
    while (1) 
    {
    }
}

void startboot() {
	asm("rjmp boot");
}

void bootloader(void) {
	asm("boot:");
	asm volatile ("cli");
	asm volatile ("clr __zero_reg__\n");
	UCSRB |= _BV(RXEN) | _BV(TXEN);
	UCSRC |= _BV(UCSZ1) | _BV(UCSZ0);
	UBRRL = 12;
	register addr16_t address;
	register pagelen_t  length;
	addr16_t buff = {(uint8_t *)(RAMSTART)};
  	putch('b');
	for(;;) {
		char ch = getch();
		
		if(ch == 'A') {
			// LOAD ADDRESS
			address.bytes[0] = getch();
			address.bytes[1] = 0;
			address.word *= 32; // Convert from word address to byte address
			verifySpace();
			putch(2);
			putch(address.bytes[1]);
			putch(address.bytes[0]);
		}
		/* Write memory, length is big endian and is in bytes */
		else if(ch == 'P') {
			// PROGRAM PAGE - we support flash programming only, not EEPROM
			uint8_t *bufPtr;
			pagelen_t savelength;

			length = getch();
			savelength = length;

			// read a page worth of contents
			bufPtr = buff.bptr;
			do *bufPtr++ = getch();
			while (--length);

			// Read command terminator, start reply
			verifySpace();
			putch(0);

			writebuffer(buff, address, savelength);


		}
		/* Read memory block mode, length is big endian.  */
		else if(ch == 'R') {
			length = getch();

			verifySpace();
			putch(length);

			read_mem(address, length);
		}
		else if (ch == 'Q') { /* 'Q' */
			// Adaboot no-wait mod
			verifySpace();
			putch(0);
		}
		putch(':');
	}
}

void putch(char ch) {
    while (!(UCSRA & _BV(UDRE))) ;
	UDR = ch;
}

uint8_t getch(void) {
  while(!(UCSRA & _BV(RXC)))  ;
  return UDR;
}

void verifySpace() {
  if (getch() != ' ') {
    WDTCSR = _BV(WDE);
	while(1) ;
  }
  putch(';');
}

static inline void writebuffer(addr16_t mybuff, addr16_t address, pagelen_t len)
{
	// Copy buffer into programming buffer
	uint16_t addrPtr = address.word;

	/*
	* Start the page erase and wait for it to finish.  There
	* used to be code to do this while receiving the data over
	* the serial link, but the performance improvement was slight,
	* and we needed the space back.
	*/
	boot_page_erase(address.word);
	boot_spm_busy_wait();

	/*
	* Copy data from the buffer into the flash write buffer.
	*/
	do {
	boot_page_fill((uint16_t)(void*)addrPtr, *(mybuff.wptr++));
	addrPtr += 2;
	} while (len -= 2);

	/*
	* Actually Write the buffer to flash (and wait for it to finish.)
	*/
	boot_page_write(address.word);
	boot_spm_busy_wait();
}

static inline void read_mem(addr16_t address, pagelen_t length)
{
    uint8_t ch;

	do {
	    // read a Flash byte and increment the address
	    __asm__ ("lpm %0,Z+\n" : "=r" (ch), "=z" (address.bptr): "1" (address));
	    putch(ch);
	} while (length--);
}