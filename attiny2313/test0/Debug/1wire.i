# 1 ".././1wire.c"
# 1 "C:\\Users\\programowanie\\Documents\\Atmel Studio\\7.0\\attiny2313\\test0\\Debug//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 ".././1wire.c"
# 1 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h" 1 3
# 44 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h" 3
# 1 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\inttypes.h" 1 3
# 37 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\inttypes.h" 3
# 1 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\lib\\gcc\\avr\\5.4.0\\include\\stdint.h" 1 3 4
# 9 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\lib\\gcc\\avr\\5.4.0\\include\\stdint.h" 3 4
# 1 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h" 1 3 4
# 125 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h" 3 4

# 125 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h" 3 4
typedef signed int int8_t __attribute__((__mode__(__QI__)));
typedef unsigned int uint8_t __attribute__((__mode__(__QI__)));
typedef signed int int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int uint16_t __attribute__ ((__mode__ (__HI__)));
typedef signed int int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int uint32_t __attribute__ ((__mode__ (__SI__)));

typedef signed int int64_t __attribute__((__mode__(__DI__)));
typedef unsigned int uint64_t __attribute__((__mode__(__DI__)));
# 146 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h" 3 4
typedef int16_t intptr_t;




typedef uint16_t uintptr_t;
# 163 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h" 3 4
typedef int8_t int_least8_t;




typedef uint8_t uint_least8_t;




typedef int16_t int_least16_t;




typedef uint16_t uint_least16_t;




typedef int32_t int_least32_t;




typedef uint32_t uint_least32_t;







typedef int64_t int_least64_t;






typedef uint64_t uint_least64_t;
# 217 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h" 3 4
typedef int8_t int_fast8_t;




typedef uint8_t uint_fast8_t;




typedef int16_t int_fast16_t;




typedef uint16_t uint_fast16_t;




typedef int32_t int_fast32_t;




typedef uint32_t uint_fast32_t;







typedef int64_t int_fast64_t;






typedef uint64_t uint_fast64_t;
# 277 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h" 3 4
typedef int64_t intmax_t;




typedef uint64_t uintmax_t;
# 10 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\lib\\gcc\\avr\\5.4.0\\include\\stdint.h" 2 3 4
# 38 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\inttypes.h" 2 3
# 77 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\inttypes.h" 3
typedef int32_t int_farptr_t;



typedef uint32_t uint_farptr_t;
# 45 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h" 2 3
# 1 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay_basic.h" 1 3
# 40 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay_basic.h" 3
static __inline__ void _delay_loop_1(uint8_t __count) __attribute__((__always_inline__));
static __inline__ void _delay_loop_2(uint16_t __count) __attribute__((__always_inline__));
# 80 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay_basic.h" 3
void
_delay_loop_1(uint8_t __count)
{
 __asm__ volatile (
  "1: dec %0" "\n\t"
  "brne 1b"
  : "=r" (__count)
  : "0" (__count)
 );
}
# 102 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay_basic.h" 3
void
_delay_loop_2(uint16_t __count)
{
 __asm__ volatile (
  "1: sbiw %0,1" "\n\t"
  "brne 1b"
  : "=w" (__count)
  : "0" (__count)
 );
}
# 46 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h" 2 3
# 1 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\math.h" 1 3
# 127 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\math.h" 3
extern double cos(double __x) __attribute__((__const__));





extern double sin(double __x) __attribute__((__const__));





extern double tan(double __x) __attribute__((__const__));






extern double fabs(double __x) __attribute__((__const__));






extern double fmod(double __x, double __y) __attribute__((__const__));
# 168 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\math.h" 3
extern double modf(double __x, double *__iptr);


extern float modff (float __x, float *__iptr);




extern double sqrt(double __x) __attribute__((__const__));


extern float sqrtf (float) __attribute__((__const__));




extern double cbrt(double __x) __attribute__((__const__));
# 195 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\math.h" 3
extern double hypot (double __x, double __y) __attribute__((__const__));







extern double square(double __x) __attribute__((__const__));






extern double floor(double __x) __attribute__((__const__));






extern double ceil(double __x) __attribute__((__const__));
# 235 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\math.h" 3
extern double frexp(double __x, int *__pexp);







extern double ldexp(double __x, int __exp) __attribute__((__const__));





extern double exp(double __x) __attribute__((__const__));





extern double cosh(double __x) __attribute__((__const__));





extern double sinh(double __x) __attribute__((__const__));





extern double tanh(double __x) __attribute__((__const__));







extern double acos(double __x) __attribute__((__const__));







extern double asin(double __x) __attribute__((__const__));






extern double atan(double __x) __attribute__((__const__));
# 299 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\math.h" 3
extern double atan2(double __y, double __x) __attribute__((__const__));





extern double log(double __x) __attribute__((__const__));





extern double log10(double __x) __attribute__((__const__));





extern double pow(double __x, double __y) __attribute__((__const__));






extern int isnan(double __x) __attribute__((__const__));
# 334 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\math.h" 3
extern int isinf(double __x) __attribute__((__const__));






__attribute__((__const__)) static inline int isfinite (double __x)
{
    unsigned char __exp;
    __asm__ (
 "mov	%0, %C1		\n\t"
 "lsl	%0		\n\t"
 "mov	%0, %D1		\n\t"
 "rol	%0		"
 : "=r" (__exp)
 : "r" (__x) );
    return __exp != 0xff;
}






__attribute__((__const__)) static inline double copysign (double __x, double __y)
{
    __asm__ (
 "bst	%D2, 7	\n\t"
 "bld	%D0, 7	"
 : "=r" (__x)
 : "0" (__x), "r" (__y) );
    return __x;
}
# 377 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\math.h" 3
extern int signbit (double __x) __attribute__((__const__));






extern double fdim (double __x, double __y) __attribute__((__const__));
# 393 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\math.h" 3
extern double fma (double __x, double __y, double __z) __attribute__((__const__));







extern double fmax (double __x, double __y) __attribute__((__const__));







extern double fmin (double __x, double __y) __attribute__((__const__));






extern double trunc (double __x) __attribute__((__const__));
# 427 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\math.h" 3
extern double round (double __x) __attribute__((__const__));
# 440 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\math.h" 3
extern long lround (double __x) __attribute__((__const__));
# 454 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\math.h" 3
extern long lrint (double __x) __attribute__((__const__));
# 47 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h" 2 3
# 86 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h" 3
static __inline__ void _delay_us(double __us) __attribute__((__always_inline__));
static __inline__ void _delay_ms(double __ms) __attribute__((__always_inline__));
# 165 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h" 3
void
_delay_ms(double __ms)
{
 double __tmp ;



 uint32_t __ticks_dc;
 extern void __builtin_avr_delay_cycles(unsigned long);
 __tmp = ((
# 174 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h"
          8000000
# 174 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h" 3
               ) / 1e3) * __ms;
# 184 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h" 3
  __ticks_dc = (uint32_t)(ceil(fabs(__tmp)));


 __builtin_avr_delay_cycles(__ticks_dc);
# 210 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h" 3
}
# 254 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h" 3
void
_delay_us(double __us)
{
 double __tmp ;



 uint32_t __ticks_dc;
 extern void __builtin_avr_delay_cycles(unsigned long);
 __tmp = ((
# 263 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h"
          8000000
# 263 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h" 3
               ) / 1e6) * __us;
# 273 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h" 3
  __ticks_dc = (uint32_t)(ceil(fabs(__tmp)));


 __builtin_avr_delay_cycles(__ticks_dc);
# 299 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h" 3
}
# 2 ".././1wire.c" 2
# 1 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\interrupt.h" 1 3
# 38 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\interrupt.h" 3
# 1 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\io.h" 1 3
# 99 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\io.h" 3
# 1 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\sfr_defs.h" 1 3
# 100 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\io.h" 2 3
# 414 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\io.h" 3
# 1 "C:\\Program Files (x86)\\Atmel\\Studio\\7.0\\Packs\\atmel\\ATtiny_DFP\\1.3.147\\include/avr/iotn2313.h" 1 3
# 658 "C:\\Program Files (x86)\\Atmel\\Studio\\7.0\\Packs\\atmel\\ATtiny_DFP\\1.3.147\\include/avr/iotn2313.h" 3
       
# 659 "C:\\Program Files (x86)\\Atmel\\Studio\\7.0\\Packs\\atmel\\ATtiny_DFP\\1.3.147\\include/avr/iotn2313.h" 3

       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
# 415 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\io.h" 2 3
# 627 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\io.h" 3
# 1 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\portpins.h" 1 3
# 628 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\io.h" 2 3

# 1 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\common.h" 1 3
# 630 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\io.h" 2 3

# 1 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\version.h" 1 3
# 632 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\io.h" 2 3






# 1 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\fuse.h" 1 3
# 239 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\fuse.h" 3
typedef struct
{
    unsigned char low;
    unsigned char high;
    unsigned char extended;
} __fuse_t;
# 639 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\io.h" 2 3


# 1 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\lock.h" 1 3
# 642 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\io.h" 2 3
# 39 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\avr\\interrupt.h" 2 3
# 3 ".././1wire.c" 2
# 1 ".././1wire.h" 1
# 17 ".././1wire.h"

# 17 ".././1wire.h"
struct scratchpad_struct {
 int16_t temperature;
 int16_t temperatureAlarm;
 uint8_t config;
 uint8_t reserved[3];
 uint8_t crc;
};

uint8_t oneWireReceiveBit();
void oneWireSendByte(uint8_t data);
uint8_t oneWireReceiveByte();
uint8_t oneWireReset();
uint8_t oneWireComputeCRC8(uint8_t inData, uint16_t seed);
int8_t oneWireSearchRom(uint8_t * bitPattern, int8_t lastDeviation);
uint16_t ds18b20ReadTemp(void);
# 4 ".././1wire.c" 2

void oneWireSendZero() {
 
# 6 ".././1wire.c" 3
__asm__ __volatile__ ("cli" ::: "memory")
# 6 ".././1wire.c"
     ;
 
# 7 ".././1wire.c" 3
(*(volatile uint8_t *)((0x1A) + 0x20)) 
# 7 ".././1wire.c"
|= 
# 7 ".././1wire.c" 3
(1 << (0))
# 7 ".././1wire.c"
      ;
 _delay_us(60);
 
# 9 ".././1wire.c" 3
(*(volatile uint8_t *)((0x1A) + 0x20)) 
# 9 ".././1wire.c"
&= ~
# 9 ".././1wire.c" 3
(1 << (0))
# 9 ".././1wire.c"
       ;
 _delay_us(10);
 
# 11 ".././1wire.c" 3
__asm__ __volatile__ ("sei" ::: "memory")
# 11 ".././1wire.c"
     ;
}

void oneWireSendOne() {
 
# 15 ".././1wire.c" 3
__asm__ __volatile__ ("cli" ::: "memory")
# 15 ".././1wire.c"
     ;
 
# 16 ".././1wire.c" 3
(*(volatile uint8_t *)((0x1A) + 0x20)) 
# 16 ".././1wire.c"
|= 
# 16 ".././1wire.c" 3
(1 << (0))
# 16 ".././1wire.c"
      ;
 _delay_us(6);
 
# 18 ".././1wire.c" 3
(*(volatile uint8_t *)((0x1A) + 0x20)) 
# 18 ".././1wire.c"
&= ~
# 18 ".././1wire.c" 3
(1 << (0))
# 18 ".././1wire.c"
       ;
 _delay_us(64);
 
# 20 ".././1wire.c" 3
__asm__ __volatile__ ("sei" ::: "memory")
# 20 ".././1wire.c"
     ;
}

uint8_t oneWireReset() {
 
# 24 ".././1wire.c" 3
__asm__ __volatile__ ("cli" ::: "memory")
# 24 ".././1wire.c"
     ;
 uint8_t ret = 0;
 
# 26 ".././1wire.c" 3
(*(volatile uint8_t *)((0x1A) + 0x20)) 
# 26 ".././1wire.c"
|= 
# 26 ".././1wire.c" 3
(1 << (0))
# 26 ".././1wire.c"
      ;
 _delay_us(480);
 
# 28 ".././1wire.c" 3
(*(volatile uint8_t *)((0x1A) + 0x20)) 
# 28 ".././1wire.c"
&= ~
# 28 ".././1wire.c" 3
(1 << (0))
# 28 ".././1wire.c"
       ;
 _delay_us(70);
 if (!(
# 30 ".././1wire.c" 3
      (*(volatile uint8_t *)((0x19) + 0x20)) 
# 30 ".././1wire.c"
               & 
# 30 ".././1wire.c" 3
                 (1 << (0))
# 30 ".././1wire.c"
                            )) ret = 1;
 _delay_us(410);
 
# 32 ".././1wire.c" 3
__asm__ __volatile__ ("sei" ::: "memory")
# 32 ".././1wire.c"
     ;
 return ret;
}

uint8_t oneWireReceiveBit() {
 
# 37 ".././1wire.c" 3
__asm__ __volatile__ ("cli" ::: "memory")
# 37 ".././1wire.c"
     ;
 uint8_t ret = 0;
 
# 39 ".././1wire.c" 3
(*(volatile uint8_t *)((0x1A) + 0x20)) 
# 39 ".././1wire.c"
|= 
# 39 ".././1wire.c" 3
(1 << (0))
# 39 ".././1wire.c"
      ;
 _delay_us(6);
 
# 41 ".././1wire.c" 3
(*(volatile uint8_t *)((0x1A) + 0x20)) 
# 41 ".././1wire.c"
&= ~
# 41 ".././1wire.c" 3
(1 << (0))
# 41 ".././1wire.c"
       ;
 _delay_us(9);
 if (
# 43 ".././1wire.c" 3
    (*(volatile uint8_t *)((0x19) + 0x20)) 
# 43 ".././1wire.c"
             & 
# 43 ".././1wire.c" 3
               (1 << (0))
# 43 ".././1wire.c"
                          ) ret = 1;
 _delay_us(55);
 
# 45 ".././1wire.c" 3
__asm__ __volatile__ ("sei" ::: "memory")
# 45 ".././1wire.c"
     ;
 return ret;
}

void oneWireSendByte(uint8_t data) {
 for (uint8_t i = 0; i < 8; i++) {
  if(data & 1) {
   oneWireSendOne();
  } else {
   oneWireSendZero();
  }
  data >>= 1;
 }
}

uint8_t oneWireReceiveByte() {
 uint8_t data = 0;
 for (uint8_t i = 0; i < 8; i++) {
  data >>= 1;
  if (oneWireReceiveBit()) data |= 0b10000000;
 }
 return data;
}

uint8_t oneWireComputeCRC8(uint8_t inData, uint16_t seed) {
 uint8_t bitsLeft;
 uint8_t temp;

 for (bitsLeft = 8; bitsLeft > 0; bitsLeft--) {
  temp = ((seed ^ inData) & 0x01);
  if (temp == 0) {
   seed >>= 1;
  }
  else {
   seed ^= 0x18;
   seed >>= 1;
   seed |= 0x80;
  }
  inData >>= 1;
 }
 return seed;
}

int8_t oneWireSearchRom(uint8_t * bitPattern, int8_t lastDeviation)
{
 unsigned char currentBit = 1;
 unsigned char newDeviation = 0;
 unsigned char bitMask = 0x01;
 unsigned char bitA;
 unsigned char bitB;

 oneWireReset();
 oneWireSendByte(0xF0);


 while (currentBit <= 64) {

  bitA = oneWireReceiveBit();
  bitB = oneWireReceiveBit();
  if (bitA && bitB) {

   return -1;
  } else if (bitA ^ bitB) {

   if (bitA) {
    (*bitPattern) |= bitMask;
   } else {
    (*bitPattern) &= ~bitMask;
   }
  }
  else {

   if (currentBit == lastDeviation) {
    (*bitPattern) |= bitMask;
   }

   else if (currentBit > lastDeviation) {
    (*bitPattern) &= ~bitMask;
    newDeviation = currentBit;
   }

   else if ( !(*bitPattern & bitMask)) {
    newDeviation = currentBit;
   }

   else {}
  }

  if ((*bitPattern) & bitMask) {
   oneWireSendOne();
  }
  else {
   oneWireSendZero();
  }

  currentBit++;


  bitMask <<= 1;
  if (!bitMask)
  {
   bitMask = 0x01;
   bitPattern++;
  }
 }
 return newDeviation;
}

uint16_t ds18b20ReadTemp(void) {
 oneWireReset();
 oneWireSendByte(0xCC);
 oneWireSendByte(0x44);
 while(!oneWireReceiveBit()) ;
 oneWireReset();
 oneWireSendByte(0xCC);
 oneWireSendByte(0xBE);

 struct scratchpad_struct scratchpad;

 uint8_t * byte = (uint8_t *) &scratchpad;


 for (uint8_t i = 0; i < sizeof(scratchpad); i++)
 byte[i] = oneWireReceiveByte();

 int crc = 0;
 byte = (uint8_t *) &scratchpad;
 for (uint8_t i = 0; i < sizeof(scratchpad) - 1; i++)
 crc = oneWireComputeCRC8(byte[i], crc);
 if(crc == scratchpad.crc) return scratchpad.temperature * 10 >> 4;
 else return 200;
}
