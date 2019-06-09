/*** MicroCore - main.cpp ***
An Arduino core designed for ATtiny13
Based on the work done by "smeezekitty" 
Modified and maintained by MCUdude
https://github.com/MCUdude/MicroCore

This is the main program where the
initializing, setup and loop function
runs.
*/

//main.cpp
//Arduino.h
//WString.h
//pins_arduino.h
//WString.cpp
//WInterrupts.cpp
//wiring.c
//wiring_private.h
//core_settings.h
//Print.h
//Print.cpp
//wiring_analog.c
//wiring_digital.c
//wiring_pulse.c
//wiring_pwm.c
//wiring_shift.c
//Tone.cpp
//WMath.cpp

#include <inttypes.h>
#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <stdio.h>
#include <util/delay.h>
#include <avr/wdt.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>

#ifndef Print_h
#define Print_h

#define DEC 10
#define HEX 16
#define OCT 8
#define BIN 2
#define BYTE 0

class Print
{
  private:
    void printNumber(unsigned long, uint8_t);
//    void printFloat(double, uint8_t);
  public:
    virtual void write(uint8_t) = 0;
    virtual void write(const char *str);
    virtual void write(const uint8_t *buffer, size_t size);
    
//    void print(const String &);
    void print(const char[]);
    void print(char, int = BYTE);
    void print(unsigned char, int = BYTE);
    void print(int, int = DEC);
    void print(unsigned int, int = DEC);
    void print(long, int = DEC);
    void print(unsigned long, int = DEC);
//    void print(double, int = 2);

//    void println(const String &s);
    void println(const char[]);
    void println(char, int = BYTE);
    void println(unsigned char, int = BYTE);
    void println(int, int = DEC);
    void println(unsigned int, int = DEC);
    void println(long, int = DEC);
    void println(unsigned long, int = DEC);
//    void println(double, int = 2);
    void println(void);
};

#endif

#ifndef core_settings_h
#define core_settings_h


// Makes the core "idiot proof" (see wiring_digital.c and wiring_pwm.h for examples where SAFEMODE is used).
// Enabling SAFEMODE takes up more flash space, but "makes sure" you don't screw up, like by reading the 
// state of a pin while it's outputting a PWM signal. If you know what you're doing, like explicitly writing
// a pin as an output before using the analogWrite() function, you can save a lot of space by disabling this.
#define SAFEMODE 

// If you're not using millis(), you can save about 100b by commenting this out.
// Note that the millis() interrupt is based on the watch dog timer, and will interrupt
// every 16th ms (which is very little. This means the millis() function will not be 
// accurate down to 1 ms, but will increase with steps of 16.
#define ENABLE_MILLIS

// Enabling micros() will cause the processor to interrupt more often (every 2048th clock cycle if 
// F_CPU < 4.8 MHz, every 16384th clock cycle if F_CPU >= 4.8 MHz. This will add some overhead when F_CPU is
// less than 4.8 MHz. It's disabled by default because it occupies precious flash space and loads the CPU with
// additional interrupts and calculations. Also note that micros() aren't very precise for frequencies that 64
// doesn't divide evenly by.
#define ENABLE_MICROS

// If you're not using the analog pins or want to set it up yourself, you can disable it here
#define SETUP_ADC

// This is the ADC settings
// Here the ADC prescaler can be changed if needed.
// Note that the sample rate should exceed 200 kHz
#define ADC_PRESCALER_DEFAULT // Selects the "best suited" prescaler based on F_CPU
//#define ADC_PRESCALER_2     // ADC sample rate = (F_CPU/13) / 2
//#define ADC_PRESCALER_4     // ADC sample rate = (F_CPU/13) / 4
//#define ADC_PRESCALER_8     // ADC sample rate = (F_CPU/13) / 8
//#define ADC_PRESCALER_16    // ADC sample rate = (F_CPU/13) / 16
//#define ADC_PRESCALER_32    // ADC sample rate = (F_CPU/13) / 32
//#define ADC_PRESCALER_64    // ADC sample rate = (F_CPU/13) / 64
//#define ADC_PRESCALER_128   // ADC sample rate = (F_CPU/13) / 128

// If you're not using the PWM or want to set it up yourself, you can disable it here
#define SETUP_PWM

// Here's the PWM settings for Timer0
// These settings will also be disabled if SETUP_PWM is commented out
// Note that ENABLE_MICROS will override this setting 
#define PWM_PRESCALER_DEFAULT // Selects the "best suited" prescaler based on F_CPU
//#define PWM_PRESCALER_NONE	// PWM frequency = (F_CPU/256) / 1
//#define PWM_PRESCALER_8			// PWM frequency = (F_CPU/256) / 8
//#define PWM_PRESCALER_64		// PWM frequency = (F_CPU/256) / 64
//#define PWM_PRESCALER_256		// PWM frequency = (F_CPU/256) / 256
//#define PWM_PRESCALER_1024	// PWM frequency = (F_CPU/256) / 1024

// These are the waveform generation settings for timer0
#define PWM_FAST				  //  <-- DEFAULT
//#define PWM_PHASE_CORRECT


#endif

#ifndef WiringPrivate_h
#define WiringPrivate_h

#include <stdarg.h>

#ifdef __cplusplus
extern "C"{
#endif

#ifndef cbi
  #define cbi(sfr, bit) (_SFR_BYTE(sfr) &= ~_BV(bit))
#endif
#ifndef sbi
  #define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))
#endif

typedef void (*voidFuncPtr)(void);

#ifdef __cplusplus
} // extern "C"
#endif

#endif

// Boards.txt defines ATtiny13A. This ensures compatibility
#if !defined(__AVR_ATtiny13__)
#define __AVR_ATtiny13__
#endif

// IO, ADC, INT and PWM
#define NUM_DIGITAL_PINS           6
#define NUM_ANALOG_INPUTS          4
#define EXTERNAL_NUM_INTERRUPTS    1
#define digitalPinToInterrupt(p)   (((p) == 1) ? 0 : NOT_AN_INTERRUPT)
#define analogInputToDigitalPin(p) (((p) == 0) ? 5 : (((p) == 1) ? 2 : (((p) == 2) ? 4 :(((p) == 3) ? 3 : -1))))
#define analogPinToChannel(p)      (p)
#define digitalPinHasPWM(p)        (((p) == 0) || ((p) == 1))

// Port and pin mapping
#if defined(SAFEMODE)
  #define digitalPinToPort(p)      (((p) >= 0 && (p) <= 5) ? 2 : 0)
  #define digitalPinToBitMask(p)   (((p) >= 0 && (p) <= 5) ? _BV(p) : -1)
  #define digitalPinToTimer(p)     (((p) == 0) ? TIMER0A : (((p) == 1) ? TIMER0B : (NOT_ON_TIMER)))
  #define analogInPinToBit(p)      (p)  
  #define portOutputRegister(p)    (((p) == 2) ? (&PORTB) : ((uint8_t *)NULL))
  #define portInputRegister(p)     (((p) == 2) ? (&PINB)  : ((uint8_t *)NULL))
  #define portModeRegister(p)      (((p) == 2) ? (&DDRB)  : ((uint8_t *)NULL))
#else
  #define digitalPinToPort(p)      (2)
  #define digitalPinToBitMask(p)   (_BV(p))
  #define digitalPinToTimer(p)     (p + 1)
  #define analogInPinToBit(p)      (p)
  #define portOutputRegister(p)    (&PORTB)
  #define portInputRegister(p)     (&PINB)
  #define portModeRegister(p)      (&DDRB)
#endif

// Analog reference macros
#define EXTERNAL 0
#define INTERNAL 1
#define INTERNAL1V1 1

// PCINT implementation
#if defined(SAFEMODE)
  #define digitalPinToPCICR(p)     (((p) >= 0 && (p) <= 5) ? (&GIMSK) : ((uint8_t *)NULL))
  #define digitalPinToPCMSK(p)     (((p) >= 0 && (p) <= 5) ? (&PCMSK) : ((uint8_t *)NULL))
#else
  #define digitalPinToPCICR(p)     (&GIMSK)
  #define digitalPinToPCMSK(p)     (&PCMSK)
#endif
#define digitalPinToPCICRbit(p)    (5)
#define digitalPinToPCMSKbit(p)    (p)


#define LED_BUILTIN 0
static const uint8_t MOSI = 0;
static const uint8_t MISO = 1;
static const uint8_t SCK  = 2;

// Ax constants cannot be used for digitalRead/digitalWrite/analogWrite functions, only analogRead()
static const uint8_t A0 = 0;
static const uint8_t A1 = 1;
static const uint8_t A2 = 2;
static const uint8_t A3 = 3;

#ifndef String_class_h
#define String_class_h
#ifdef __cplusplus

#include <ctype.h>

// When compiling programs with this class, the following gcc parameters
// dramatically increase performance and memory (RAM) efficiency, typically
// with little or no increase in code size.
//     -felide-constructors
//     -std=c++0x

class __FlashStringHelper;
#define F(string_literal) (reinterpret_cast<const __FlashStringHelper *>(PSTR(string_literal)))

// An inherited class for holding the result of a concatenation.  These
// result objects are assumed to be writable by subsequent concatenations.
class StringSumHelper;

// The string class
class String
{
  // use a function pointer to allow for "if (s)" without the
  // complications of an operator bool(). for more information, see:
  // http://www.artima.com/cppsource/safebool.html
  typedef void (String::*StringIfHelperType)() const;
  void StringIfHelper() const {}

public:
  // constructors
  // creates a copy of the initial value.
  // if the initial value is null or invalid, or if memory allocation
  // fails, the string will be marked as invalid (i.e. "if (s)" will
  // be false).
  String(const char *cstr = "");
  String(const String &str);
  String(const __FlashStringHelper *str);
       #if __cplusplus >= 201103L || defined(__GXX_EXPERIMENTAL_CXX0X__)
  String(String &&rval);
  String(StringSumHelper &&rval);
  #endif
  explicit String(char c);
  explicit String(unsigned char, unsigned char base=10);
  explicit String(int, unsigned char base=10);
  explicit String(unsigned int, unsigned char base=10);
  explicit String(long, unsigned char base=10);
  explicit String(unsigned long, unsigned char base=10);
  explicit String(float, unsigned char decimalPlaces=2);
  explicit String(double, unsigned char decimalPlaces=2);
  ~String(void);

  // memory management
  // return true on success, false on failure (in which case, the string
  // is left unchanged).  reserve(0), if successful, will validate an
  // invalid string (i.e., "if (s)" will be true afterwards)
  unsigned char reserve(unsigned int size);
  inline unsigned int length(void) const {return len;}

  // creates a copy of the assigned value.  if the value is null or
  // invalid, or if the memory allocation fails, the string will be
  // marked as invalid ("if (s)" will be false).
  String & operator = (const String &rhs);
  String & operator = (const char *cstr);
  String & operator = (const __FlashStringHelper *str);
       #if __cplusplus >= 201103L || defined(__GXX_EXPERIMENTAL_CXX0X__)
  String & operator = (String &&rval);
  String & operator = (StringSumHelper &&rval);
  #endif

  // concatenate (works w/ built-in types)

  // returns true on success, false on failure (in which case, the string
  // is left unchanged).  if the argument is null or invalid, the
  // concatenation is considered unsucessful.
  unsigned char concat(const String &str);
  unsigned char concat(const char *cstr);
  unsigned char concat(char c);
  unsigned char concat(unsigned char c);
  unsigned char concat(int num);
  unsigned char concat(unsigned int num);
  unsigned char concat(long num);
  unsigned char concat(unsigned long num);
  unsigned char concat(float num);
  unsigned char concat(double num);
  unsigned char concat(const __FlashStringHelper * str);

  // if there's not enough memory for the concatenated value, the string
  // will be left unchanged (but this isn't signalled in any way)
  String & operator += (const String &rhs)  {concat(rhs); return (*this);}
  String & operator += (const char *cstr)    {concat(cstr); return (*this);}
  String & operator += (char c)      {concat(c); return (*this);}
  String & operator += (unsigned char num)    {concat(num); return (*this);}
  String & operator += (int num)      {concat(num); return (*this);}
  String & operator += (unsigned int num)    {concat(num); return (*this);}
  String & operator += (long num)      {concat(num); return (*this);}
  String & operator += (unsigned long num)  {concat(num); return (*this);}
  String & operator += (float num)    {concat(num); return (*this);}
  String & operator += (double num)    {concat(num); return (*this);}
  String & operator += (const __FlashStringHelper *str){concat(str); return (*this);}

  friend StringSumHelper & operator + (const StringSumHelper &lhs, const String &rhs);
  friend StringSumHelper & operator + (const StringSumHelper &lhs, const char *cstr);
  friend StringSumHelper & operator + (const StringSumHelper &lhs, char c);
  friend StringSumHelper & operator + (const StringSumHelper &lhs, unsigned char num);
  friend StringSumHelper & operator + (const StringSumHelper &lhs, int num);
  friend StringSumHelper & operator + (const StringSumHelper &lhs, unsigned int num);
  friend StringSumHelper & operator + (const StringSumHelper &lhs, long num);
  friend StringSumHelper & operator + (const StringSumHelper &lhs, unsigned long num);
  friend StringSumHelper & operator + (const StringSumHelper &lhs, float num);
  friend StringSumHelper & operator + (const StringSumHelper &lhs, double num);
  friend StringSumHelper & operator + (const StringSumHelper &lhs, const __FlashStringHelper *rhs);

  // comparison (only works w/ Strings and "strings")
  operator StringIfHelperType() const { return buffer ? &String::StringIfHelper : 0; }
  int compareTo(const String &s) const;
  unsigned char equals(const String &s) const;
  unsigned char equals(const char *cstr) const;
  unsigned char operator == (const String &rhs) const {return equals(rhs);}
  unsigned char operator == (const char *cstr) const {return equals(cstr);}
  unsigned char operator != (const String &rhs) const {return !equals(rhs);}
  unsigned char operator != (const char *cstr) const {return !equals(cstr);}
  unsigned char operator <  (const String &rhs) const;
  unsigned char operator >  (const String &rhs) const;
  unsigned char operator <= (const String &rhs) const;
  unsigned char operator >= (const String &rhs) const;
  unsigned char equalsIgnoreCase(const String &s) const;
  unsigned char startsWith( const String &prefix) const;
  unsigned char startsWith(const String &prefix, unsigned int offset) const;
  unsigned char endsWith(const String &suffix) const;

  // character acccess
  char charAt(unsigned int index) const;
  void setCharAt(unsigned int index, char c);
  char operator [] (unsigned int index) const;
  char& operator [] (unsigned int index);
  void getBytes(unsigned char *buf, unsigned int bufsize, unsigned int index=0) const;
  void toCharArray(char *buf, unsigned int bufsize, unsigned int index=0) const
    {getBytes((unsigned char *)buf, bufsize, index);}
  const char * c_str() const { return buffer; }
  const char* begin() { return c_str(); }
  const char* end() { return c_str() + length(); }

  // search
  int indexOf( char ch ) const;
  int indexOf( char ch, unsigned int fromIndex ) const;
  int indexOf( const String &str ) const;
  int indexOf( const String &str, unsigned int fromIndex ) const;
  int lastIndexOf( char ch ) const;
  int lastIndexOf( char ch, unsigned int fromIndex ) const;
  int lastIndexOf( const String &str ) const;
  int lastIndexOf( const String &str, unsigned int fromIndex ) const;
  String substring( unsigned int beginIndex ) const { return substring(beginIndex, len); };
  String substring( unsigned int beginIndex, unsigned int endIndex ) const;

  // modification
  void replace(char find, char replace);
  void replace(const String& find, const String& replace);
  void remove(unsigned int index);
  void remove(unsigned int index, unsigned int count);
  void toLowerCase(void);
  void toUpperCase(void);
  void trim(void);

  // parsing/conversion
  long toInt(void) const;
  float toFloat(void) const;
  double toDouble(void) const;

protected:
  char *buffer;          // the actual char array
  unsigned int capacity;  // the array length minus one (for the '\0')
  unsigned int len;       // the String length (not counting the '\0')
protected:
  void init(void);
  void invalidate(void);
  unsigned char changeBuffer(unsigned int maxStrLen);
  unsigned char concat(const char *cstr, unsigned int length);

  // copy and move
  String & copy(const char *cstr, unsigned int length);
  String & copy(const __FlashStringHelper *pstr, unsigned int length);
       #if __cplusplus >= 201103L || defined(__GXX_EXPERIMENTAL_CXX0X__)
  void move(String &rhs);
  #endif
};

class StringSumHelper : public String
{
public:
  StringSumHelper(const String &s) : String(s) {}
  StringSumHelper(const char *p) : String(p) {}
  StringSumHelper(char c) : String(c) {}
  StringSumHelper(unsigned char num) : String(num) {}
  StringSumHelper(int num) : String(num) {}
  StringSumHelper(unsigned int num) : String(num) {}
  StringSumHelper(long num) : String(num) {}
  StringSumHelper(unsigned long num) : String(num) {}
  StringSumHelper(float num) : String(num) {}
  StringSumHelper(double num) : String(num) {}
};

#endif  // __cplusplus
#endif  // String_class_h
  
#ifndef Arduino_h
#define Arduino_h

#include <stdbool.h>
#include <stdint.h>

#ifdef __cplusplus
extern "C"{	
#endif
  #define HIGH 1
  #define LOW 0
  #define INPUT 0
  #define OUTPUT 1
  #define INPUT_PULLUP 2
  #define FALSE 0
  #define TRUE 1
  #define PI 3.1416
  #define HALF_PI 1.57
  #define TWO_PI 6.283
  #define DEG_TO_RAD 0.0174533
  #define RAD_TO_DEG 57.2958
  #define SERIAL 0
  #define DISPLAY 1 
  #define LSBFIRST 0
  #define MSBFIRST 1
  #define CHANGE 1
  #define FALLING 2
  #define RISING 3
  #define DEFAULT 0
  #define NOT_AN_INTERRUPT -1
  #define NOT_ON_TIMER 0
  #define NOT_A_PIN 0
  #define TIMER0A 1
  #define TIMER0B 2
  #ifdef abs
    #undef abs
  #endif
  #define min(a,b) ((a)<(b)?(a):(b))
  #define max(a,b) ((a)>(b)?(a):(b))
  #define abs(x)   ((x)>0?(x):-(x))
  #define constrain(amt,low,high) ((amt)<(low)?(low):((amt)>(high)?(high):(amt)))
  #define round(x)     ((x)>=0?(int32_t)((x)+0.5):(int32_t)((x)-0.5))
  #define radians(deg) ((deg)*DEG_TO_RAD)
  #define degrees(rad) ((rad)*RAD_TO_DEG)
  #define sq(x)        ((x)*(x))
  #define interrupts() sei()
  #define noInterrupts() cli()
  #define clockCyclesPerMicrosecond()  ( F_CPU / 1000000L )
  #define clockCyclesToMicroseconds(a) ( ((a) * 1000L) / (F_CPU / 1000L) )
  #define microsecondsToClockCycles(a) ( ((a) * (F_CPU / 1000L)) / 1000L )
  #define lowByte(w)  ((uint8_t) ((w) & 0xff))
  #define highByte(w) ((uint8_t) ((w) >> 8))
  #define bitRead(value, bit)  (((value) >> (bit)) & 0x01)
  #define bitSet(value, bit)   ((value) |= (1UL << (bit)))
  #define bitClear(value, bit) ((value) &= ~(1UL << (bit)))
  #define bitWrite(value, bit, bitvalue) (bitvalue ? bitSet(value, bit) : bitClear(value, bit))
  #define delayMicroseconds(us) _delay_us(us) // _delay_us function wrapper
  #define bit(b) (1UL << (b))
  typedef uint16_t word;
  typedef uint8_t byte;
  typedef bool boolean;
  void init(void);
  void pinMode(uint8_t pin, uint8_t mode);
  void digitalWrite(uint8_t pin, uint8_t val);
  void delay(uint16_t ms);
  uint8_t digitalRead(uint8_t pin);
  int16_t analogRead(uint8_t pin); 
  void analogReference(uint8_t mode);
  void turnOffPWM(uint8_t pin);
  void analogWrite(uint8_t pin, uint8_t val);
  uint32_t millis(void);
  uint32_t micros(void);
  void shiftOut(uint8_t dataPin, uint8_t clockPin, uint8_t bitOrder, uint8_t val);
  uint8_t shiftIn(uint8_t dataPin, uint8_t clockPin, uint8_t bitOrder);
  uint32_t pulseIn(uint8_t pin, uint8_t state, uint32_t timeout);
  void attachInterrupt(uint8_t interruptNum, void (*)(void), uint8_t mode);
  void detachInterrupt(uint8_t interruptNum);
  void setup(void);
  void loop(void);
  
#ifdef __cplusplus
} // extern "C"



#ifdef __cplusplus
  // Tone functions
  void tone(uint8_t pin, uint16_t frequency, uint32_t duration = 0);
  void toneRaw(uint8_t pin, uint8_t midPoint, uint32_t lengthTicks, uint8_t prescaleBitMask);
  void noTone(uint8_t pin = 255);
  void stopTone(void);
 
  uint16_t makeWord(uint16_t w);
  uint16_t makeWord(uint8_t h, uint8_t l);
  #define word(...) makeWord(__VA_ARGS__)
  
  // Math functions
  int32_t random(int32_t howbig);
  int32_t random(int32_t howsmall, int32_t howbig);
  void randomSeed(uint16_t seed);
  template <typename A, typename B, typename C, typename D, typename E> 
  int32_t map(A x, B in_min, C in_max, D out_min, E out_max)
  {
    return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min;
  }
  
#endif

#endif

#endif

int main(void)
{
  init();  // Call init routine (wiring.c)
  setup(); // Call user provided setup()
  while(1) // Continuously call user provided loop()
  {
    loop(); 
  }
}

void setup(){}
void loop(){}

/*********************************************/
/*  Constructors                             */
/*********************************************/

String::String(const char *cstr)
{
  init();
  if (cstr) copy(cstr, strlen(cstr));
}

String::String(const String &value)
{
  init();
  *this = value;
}

String::String(const __FlashStringHelper *pstr)
{
  init();
  *this = pstr;
}

#if __cplusplus >= 201103L || defined(__GXX_EXPERIMENTAL_CXX0X__)
String::String(String &&rval)
{
  init();
  move(rval);
}
String::String(StringSumHelper &&rval)
{
  init();
  move(rval);
}
#endif

String::String(char c)
{
  init();
  char buf[2];
  buf[0] = c;
  buf[1] = 0;
  *this = buf;
}

String::String(unsigned char value, unsigned char base)
{
  init();
  char buf[1 + 8 * sizeof(unsigned char)];
  utoa(value, buf, base);
  *this = buf;
}

String::String(int value, unsigned char base)
{
  init();
  char buf[2 + 8 * sizeof(int)];
  itoa(value, buf, base);
  *this = buf;
}

String::String(unsigned int value, unsigned char base)
{
  init();
  char buf[1 + 8 * sizeof(unsigned int)];
  utoa(value, buf, base);
  *this = buf;
}

String::String(long value, unsigned char base)
{
  init();
  char buf[2 + 8 * sizeof(long)];
  ltoa(value, buf, base);
  *this = buf;
}

String::String(unsigned long value, unsigned char base)
{
  init();
  char buf[1 + 8 * sizeof(unsigned long)];
  ultoa(value, buf, base);
  *this = buf;
}

String::String(float value, unsigned char decimalPlaces)
{
  init();
  char buf[33];
  *this = dtostrf(value, (decimalPlaces + 2), decimalPlaces, buf);
}

String::String(double value, unsigned char decimalPlaces)
{
  init();
  char buf[33];
  *this = dtostrf(value, (decimalPlaces + 2), decimalPlaces, buf);
}

String::~String()
{
  free(buffer);
}

/*********************************************/
/*  Memory Management                        */
/*********************************************/

inline void String::init(void)
{
  buffer = NULL;
  capacity = 0;
  len = 0;
}

void String::invalidate(void)
{
  if (buffer) free(buffer);
  buffer = NULL;
  capacity = len = 0;
}

unsigned char String::reserve(unsigned int size)
{
  if (buffer && capacity >= size) return 1;
  if (changeBuffer(size)) {
    if (len == 0) buffer[0] = 0;
    return 1;
  }
  return 0;
}

unsigned char String::changeBuffer(unsigned int maxStrLen)
{
  char *newbuffer = (char *)realloc(buffer, maxStrLen + 1);
  if (newbuffer) {
    buffer = newbuffer;
    capacity = maxStrLen;
    return 1;
  }
  return 0;
}

/*********************************************/
/*  Copy and Move                            */
/*********************************************/

String & String::copy(const char *cstr, unsigned int length)
{
  if (!reserve(length)) {
    invalidate();
    return *this;
  }
  len = length;
  strcpy(buffer, cstr);
  return *this;
}

String & String::copy(const __FlashStringHelper *pstr, unsigned int length)
{
  if (!reserve(length)) {
    invalidate();
    return *this;
  }
  len = length;
  strcpy_P(buffer, (PGM_P)pstr);
  return *this;
}

#if __cplusplus >= 201103L || defined(__GXX_EXPERIMENTAL_CXX0X__)
void String::move(String &rhs)
{
  if (buffer) {
    if (capacity >= rhs.len) {
      strcpy(buffer, rhs.buffer);
      len = rhs.len;
      rhs.len = 0;
      return;
    } else {
      free(buffer);
    }
  }
  buffer = rhs.buffer;
  capacity = rhs.capacity;
  len = rhs.len;
  rhs.buffer = NULL;
  rhs.capacity = 0;
  rhs.len = 0;
}
#endif

String & String::operator = (const String &rhs)
{
  if (this == &rhs) return *this;
  
  if (rhs.buffer) copy(rhs.buffer, rhs.len);
  else invalidate();
  
  return *this;
}

#if __cplusplus >= 201103L || defined(__GXX_EXPERIMENTAL_CXX0X__)
String & String::operator = (String &&rval)
{
  if (this != &rval) move(rval);
  return *this;
}

String & String::operator = (StringSumHelper &&rval)
{
  if (this != &rval) move(rval);
  return *this;
}
#endif

String & String::operator = (const char *cstr)
{
  if (cstr) copy(cstr, strlen(cstr));
  else invalidate();
  
  return *this;
}

String & String::operator = (const __FlashStringHelper *pstr)
{
  if (pstr) copy(pstr, strlen_P((PGM_P)pstr));
  else invalidate();

  return *this;
}

/*********************************************/
/*  concat                                   */
/*********************************************/

unsigned char String::concat(const String &s)
{
  return concat(s.buffer, s.len);
}

unsigned char String::concat(const char *cstr, unsigned int length)
{
  unsigned int newlen = len + length;
  if (!cstr) return 0;
  if (length == 0) return 1;
  if (!reserve(newlen)) return 0;
  strcpy(buffer + len, cstr);
  len = newlen;
  return 1;
}

unsigned char String::concat(const char *cstr)
{
  if (!cstr) return 0;
  return concat(cstr, strlen(cstr));
}

unsigned char String::concat(char c)
{
  char buf[2];
  buf[0] = c;
  buf[1] = 0;
  return concat(buf, 1);
}

unsigned char String::concat(unsigned char num)
{
  char buf[1 + 3 * sizeof(unsigned char)];
  itoa(num, buf, 10);
  return concat(buf, strlen(buf));
}

unsigned char String::concat(int num)
{
  char buf[2 + 3 * sizeof(int)];
  itoa(num, buf, 10);
  return concat(buf, strlen(buf));
}

unsigned char String::concat(unsigned int num)
{
  char buf[1 + 3 * sizeof(unsigned int)];
  utoa(num, buf, 10);
  return concat(buf, strlen(buf));
}

unsigned char String::concat(long num)
{
  char buf[2 + 3 * sizeof(long)];
  ltoa(num, buf, 10);
  return concat(buf, strlen(buf));
}

unsigned char String::concat(unsigned long num)
{
  char buf[1 + 3 * sizeof(unsigned long)];
  ultoa(num, buf, 10);
  return concat(buf, strlen(buf));
}

unsigned char String::concat(float num)
{
  char buf[20];
  char* string = dtostrf(num, 4, 2, buf);
  return concat(string, strlen(string));
}

unsigned char String::concat(double num)
{
  char buf[20];
  char* string = dtostrf(num, 4, 2, buf);
  return concat(string, strlen(string));
}

unsigned char String::concat(const __FlashStringHelper * str)
{
  if (!str) return 0;
  int length = strlen_P((const char *) str);
  if (length == 0) return 1;
  unsigned int newlen = len + length;
  if (!reserve(newlen)) return 0;
  strcpy_P(buffer + len, (const char *) str);
  len = newlen;
  return 1;
}

/*********************************************/
/*  Concatenate                              */
/*********************************************/

StringSumHelper & operator + (const StringSumHelper &lhs, const String &rhs)
{
  StringSumHelper &a = const_cast<StringSumHelper&>(lhs);
  if (!a.concat(rhs.buffer, rhs.len)) a.invalidate();
  return a;
}

StringSumHelper & operator + (const StringSumHelper &lhs, const char *cstr)
{
  StringSumHelper &a = const_cast<StringSumHelper&>(lhs);
  if (!cstr || !a.concat(cstr, strlen(cstr))) a.invalidate();
  return a;
}

StringSumHelper & operator + (const StringSumHelper &lhs, char c)
{
  StringSumHelper &a = const_cast<StringSumHelper&>(lhs);
  if (!a.concat(c)) a.invalidate();
  return a;
}

StringSumHelper & operator + (const StringSumHelper &lhs, unsigned char num)
{
  StringSumHelper &a = const_cast<StringSumHelper&>(lhs);
  if (!a.concat(num)) a.invalidate();
  return a;
}

StringSumHelper & operator + (const StringSumHelper &lhs, int num)
{
  StringSumHelper &a = const_cast<StringSumHelper&>(lhs);
  if (!a.concat(num)) a.invalidate();
  return a;
}

StringSumHelper & operator + (const StringSumHelper &lhs, unsigned int num)
{
  StringSumHelper &a = const_cast<StringSumHelper&>(lhs);
  if (!a.concat(num)) a.invalidate();
  return a;
}

StringSumHelper & operator + (const StringSumHelper &lhs, long num)
{
  StringSumHelper &a = const_cast<StringSumHelper&>(lhs);
  if (!a.concat(num)) a.invalidate();
  return a;
}

StringSumHelper & operator + (const StringSumHelper &lhs, unsigned long num)
{
  StringSumHelper &a = const_cast<StringSumHelper&>(lhs);
  if (!a.concat(num)) a.invalidate();
  return a;
}

StringSumHelper & operator + (const StringSumHelper &lhs, float num)
{
  StringSumHelper &a = const_cast<StringSumHelper&>(lhs);
  if (!a.concat(num)) a.invalidate();
  return a;
}

StringSumHelper & operator + (const StringSumHelper &lhs, double num)
{
  StringSumHelper &a = const_cast<StringSumHelper&>(lhs);
  if (!a.concat(num)) a.invalidate();
  return a;
}

StringSumHelper & operator + (const StringSumHelper &lhs, const __FlashStringHelper *rhs)
{
  StringSumHelper &a = const_cast<StringSumHelper&>(lhs);
  if (!a.concat(rhs))  a.invalidate();
  return a;
}

/*********************************************/
/*  Comparison                               */
/*********************************************/

int String::compareTo(const String &s) const
{
  if (!buffer || !s.buffer) {
    if (s.buffer && s.len > 0) return 0 - *(unsigned char *)s.buffer;
    if (buffer && len > 0) return *(unsigned char *)buffer;
    return 0;
  }
  return strcmp(buffer, s.buffer);
}

unsigned char String::equals(const String &s2) const
{
  return (len == s2.len && compareTo(s2) == 0);
}

unsigned char String::equals(const char *cstr) const
{
  if (len == 0) return (cstr == NULL || *cstr == 0);
  if (cstr == NULL) return buffer[0] == 0;
  return strcmp(buffer, cstr) == 0;
}

unsigned char String::operator<(const String &rhs) const
{
  return compareTo(rhs) < 0;
}

unsigned char String::operator>(const String &rhs) const
{
  return compareTo(rhs) > 0;
}

unsigned char String::operator<=(const String &rhs) const
{
  return compareTo(rhs) <= 0;
}

unsigned char String::operator>=(const String &rhs) const
{
  return compareTo(rhs) >= 0;
}

unsigned char String::equalsIgnoreCase( const String &s2 ) const
{
  if (this == &s2) return 1;
  if (len != s2.len) return 0;
  if (len == 0) return 1;
  const char *p1 = buffer;
  const char *p2 = s2.buffer;
  while (*p1) {
    if (tolower(*p1++) != tolower(*p2++)) return 0;
  } 
  return 1;
}

unsigned char String::startsWith( const String &s2 ) const
{
  if (len < s2.len) return 0;
  return startsWith(s2, 0);
}

unsigned char String::startsWith( const String &s2, unsigned int offset ) const
{
  if (offset > len - s2.len || !buffer || !s2.buffer) return 0;
  return strncmp( &buffer[offset], s2.buffer, s2.len ) == 0;
}

unsigned char String::endsWith( const String &s2 ) const
{
  if ( len < s2.len || !buffer || !s2.buffer) return 0;
  return strcmp(&buffer[len - s2.len], s2.buffer) == 0;
}

/*********************************************/
/*  Character Access                         */
/*********************************************/

char String::charAt(unsigned int loc) const
{
  return operator[](loc);
}

void String::setCharAt(unsigned int loc, char c) 
{
  if (loc < len) buffer[loc] = c;
}

char & String::operator[](unsigned int index)
{
  static char dummy_writable_char;
  if (index >= len || !buffer) {
    dummy_writable_char = 0;
    return dummy_writable_char;
  }
  return buffer[index];
}

char String::operator[]( unsigned int index ) const
{
  if (index >= len || !buffer) return 0;
  return buffer[index];
}

void String::getBytes(unsigned char *buf, unsigned int bufsize, unsigned int index) const
{
  if (!bufsize || !buf) return;
  if (index >= len) {
    buf[0] = 0;
    return;
  }
  unsigned int n = bufsize - 1;
  if (n > len - index) n = len - index;
  strncpy((char *)buf, buffer + index, n);
  buf[n] = 0;
}

/*********************************************/
/*  Search                                   */
/*********************************************/

int String::indexOf(char c) const
{
  return indexOf(c, 0);
}

int String::indexOf( char ch, unsigned int fromIndex ) const
{
  if (fromIndex >= len) return -1;
  const char* temp = strchr(buffer + fromIndex, ch);
  if (temp == NULL) return -1;
  return temp - buffer;
}

int String::indexOf(const String &s2) const
{
  return indexOf(s2, 0);
}

int String::indexOf(const String &s2, unsigned int fromIndex) const
{
  if (fromIndex >= len) return -1;
  const char *found = strstr(buffer + fromIndex, s2.buffer);
  if (found == NULL) return -1;
  return found - buffer;
}

int String::lastIndexOf( char theChar ) const
{
  return lastIndexOf(theChar, len - 1);
}

int String::lastIndexOf(char ch, unsigned int fromIndex) const
{
  if (fromIndex >= len) return -1;
  char tempchar = buffer[fromIndex + 1];
  buffer[fromIndex + 1] = '\0';
  char* temp = strrchr( buffer, ch );
  buffer[fromIndex + 1] = tempchar;
  if (temp == NULL) return -1;
  return temp - buffer;
}

int String::lastIndexOf(const String &s2) const
{
  return lastIndexOf(s2, len - s2.len);
}

int String::lastIndexOf(const String &s2, unsigned int fromIndex) const
{
    if (s2.len == 0 || len == 0 || s2.len > len) return -1;
  if (fromIndex >= len) fromIndex = len - 1;
  int found = -1;
  for (char *p = buffer; p <= buffer + fromIndex; p++) {
    p = strstr(p, s2.buffer);
    if (!p) break;
    if ((unsigned int)(p - buffer) <= fromIndex) found = p - buffer;
  }
  return found;
}

String String::substring(unsigned int left, unsigned int right) const
{
  if (left > right) {
    unsigned int temp = right;
    right = left;
    left = temp;
  }
  String out;
  if (left >= len) return out;
  if (right > len) right = len;
  char temp = buffer[right];  // save the replaced character
  buffer[right] = '\0';  
  out = buffer + left;  // pointer arithmetic
  buffer[right] = temp;  //restore character
  return out;
}

/*********************************************/
/*  Modification                             */
/*********************************************/

void String::replace(char find, char replace)
{
  if (!buffer) return;
  for (char *p = buffer; *p; p++) {
    if (*p == find) *p = replace;
  }
}

void String::replace(const String& find, const String& replace)
{
  if (len == 0 || find.len == 0) return;
  int diff = replace.len - find.len;
  char *readFrom = buffer;
  char *foundAt;
  if (diff == 0) {
    while ((foundAt = strstr(readFrom, find.buffer)) != NULL) {
      memcpy(foundAt, replace.buffer, replace.len);
      readFrom = foundAt + replace.len;
    }
  } else if (diff < 0) {
    char *writeTo = buffer;
    while ((foundAt = strstr(readFrom, find.buffer)) != NULL) {
      unsigned int n = foundAt - readFrom;
      memcpy(writeTo, readFrom, n);
      writeTo += n;
      memcpy(writeTo, replace.buffer, replace.len);
      writeTo += replace.len;
      readFrom = foundAt + find.len;
      len += diff;
    }
    strcpy(writeTo, readFrom);
  } else {
    unsigned int size = len; // compute size needed for result
    while ((foundAt = strstr(readFrom, find.buffer)) != NULL) {
      readFrom = foundAt + find.len;
      size += diff;
    }
    if (size == len) return;
    if (size > capacity && !changeBuffer(size)) return; // XXX: tell user!
    int index = len - 1;
    while (index >= 0 && (index = lastIndexOf(find, index)) >= 0) {
      readFrom = buffer + index + find.len;
      memmove(readFrom + diff, readFrom, len - (readFrom - buffer));
      len += diff;
      buffer[len] = 0;
      memcpy(buffer + index, replace.buffer, replace.len);
      index--;
    }
  }
}

void String::remove(unsigned int index){
  // Pass the biggest integer as the count. The remove method
  // below will take care of truncating it at the end of the
  // string.
  remove(index, (unsigned int)-1);
}

void String::remove(unsigned int index, unsigned int count){
  if (index >= len) { return; }
  if (count <= 0) { return; }
  if (count > len - index) { count = len - index; }
  char *writeTo = buffer + index;
  len = len - count;
  strncpy(writeTo, buffer + index + count,len - index);
  buffer[len] = 0;
}

void String::toLowerCase(void)
{
  if (!buffer) return;
  for (char *p = buffer; *p; p++) {
    *p = tolower(*p);
  }
}

void String::toUpperCase(void)
{
  if (!buffer) return;
  for (char *p = buffer; *p; p++) {
    *p = toupper(*p);
  }
}

void String::trim(void)
{
  if (!buffer || len == 0) return;
  char *begin = buffer;
  while (isspace(*begin)) begin++;
  char *end = buffer + len - 1;
  while (isspace(*end) && end >= begin) end--;
  len = end + 1 - begin;
  if (begin > buffer) memcpy(buffer, begin, len);
  buffer[len] = 0;
}

/*********************************************/
/*  Parsing / Conversion                     */
/*********************************************/

long String::toInt(void) const
{
  if (buffer) return atol(buffer);
  return 0;
}

float String::toFloat(void) const
{
  return float(toDouble());
}

double String::toDouble(void) const
{
  if (buffer) return atof(buffer);
  return 0;
}



#define EXTERNAL_INTERRUPT_0 0

static volatile voidFuncPtr intFunc;

void attachInterrupt(uint8_t interruptNum, void (*userFunc)(void), uint8_t mode) 
{
  // SAFEMODE prevents you from inserting an interrupt number that's not supported
  #ifdef SAFEMODE
  if(interruptNum != EXTERNAL_INTERRUPT_0)
    return;
  #endif
  
  uint8_t SaveSREG = SREG; // Save interrupt flag

  cli(); // Disable interrupts
    
  intFunc = userFunc; // access the shared data
    
  SREG = SaveSREG; // Restore the interrupt flag
    
  // Configure the interrupt mode (trigger on low input, any change, rising
  // edge, or falling edge).  The mode constants were chosen to correspond
  // to the configuration bits in the hardware register, so we simply shift
  // the mode into place.
      
  // Enable INT0 on pin PB1
  MCUCR = (MCUCR & ~((1 << ISC00) | (1 << ISC01))) | (mode << ISC00);
  GIMSK |= (1 << INT0);
}


void detachInterrupt(uint8_t interruptNum) 
{
  // SAFEMODE prevents you from inserting an interrupt number that's not supported
  #ifdef SAFEMODE
  if(interruptNum != EXTERNAL_INTERRUPT_0)
    return;
  #endif
  
  // Disable INT0 on pin PB1
  GIMSK &= ~(1 << INT0);
  intFunc = 0;
}


// AttachInterrupt ISR
ISR(INT0_vect)
{
  intFunc();
}

/***** MILLIS() *****/
// The millis counter is based on the watchdog timer, and takes very little processing time and power.
// If 16 ms accuracy is enough, I strongly recommend you to use millis() instead of micros().
#ifdef ENABLE_MILLIS
volatile uint32_t wdt_interrupt_counter = 0;

// This ISR will execute every 16 ms, and increase 
ISR(WDT_vect)
{
  wdt_interrupt_counter++;
}

// Since the WDT counter counts every 16th ms, we'll need to
// multiply by 16 to get the correct millis value.
// The WDT uses it's own clock, so this function is valid
// for all F_CPUs.
uint32_t millis()
{  
  return wdt_interrupt_counter * 16;
}
#endif // ENABLE_MILLIS


/***** MICROS() *****/
// Enabling micros() will cause the processor to interrupt more often (every 2048th clock cycle if 
// F_CPU < 4.8 MHz, every 16384th clock cycle if F_CPU >= 4.8 MHz. This will add some overhead when F_CPU is
// less than 4.8 MHz. It's disabled by default because it occupies precious flash space and loads the CPU with
// additional interrupts and calculations. Also note that micros() aren't very precise for frequencies that 64
// doesn't divide evenly by, such as 9.6 and 4.8 MHz.
#ifdef ENABLE_MICROS
volatile uint32_t timer0_overflow = 0;

// This will cause an interrupt every 256*64 clock cycle
ISR(TIM0_OVF_vect)
{
  timer0_overflow++; // Increment counter by one
}

uint32_t micros()
{
  uint32_t x;
  uint8_t t;  
  
  uint8_t oldSREG = SREG; // Preserve old SREG value 
  t = TCNT0;              // Store timer0 counter value
  cli();                  // Disable global interrupts
  x = timer0_overflow;    // Store timer0 overflow count
  SREG = oldSREG;         // Restore SREG
  
  #if F_CPU == 20000000L
    // Each timer tick is 1/(16MHz/64) = 3.2us long. We multiply the timer0_overflow variable
    // by 256 (bitshift 8 times) and we add the current timer count TCNT0. Since each tick is 3.2us long,
    // we multiply by 3 at the end
    return ((x << 8) + t) * 3;
  #elif F_CPU == 16000000L
    // Each timer tick is 1/(16MHz/64) = 4us long. We multiply the timer0_overflow variable
    // by 256 (bitshift 8 times) and we add the current timer count TCNT0. Since each tick is 4us long,
    // we multiply by 4 at the end
    return ((x << 8) + t) * 4;
  #elif F_CPU == 1200000L
    // Each timer tick is 1/(12MHz/64) = 5.333us long. We multiply the timer0_overflow variable
    // by 256 (bitshift 8 times) and we add the current timer count TCNT0. Since each tick is 5.333us long,
    // we multiply by 5 at the end
    return ((x << 8) + t) * 5;  
  #elif F_CPU == 9600000L
    // Each timer tick is 1/(9.6MHz/64) = 6.666us long. We multiply the timer0_overflow variable
    // by 256 (bitshift 8 times) and we add the current timer count TCNT0. Since each tick is 6.666us long,
    // we multiply by 7 at the end
    return ((x << 8) + t) * 7;
  #elif F_CPU == 8000000L
    // Each timer tick is 1/(8MHz/64) = 8us long. We multiply the timer0_overflow variable
    // by 256 (bitshift 8 times) and we add the current timer count TCNT0. Since each tick is 8us long,
    // we multiply by 8 at the end
    return ((x << 8) + t) * 8;
  #elif F_CPU == 4800000L
    // Each timer tick is 1/(4.8MHz/64) = 13.333us long. We multiply the timer0_overflow variable
    // by 256 (bitshift 8 times) and we add the current timer count TCNT0. Since each tick is 13.333us long,
    // we multiply by 13 at the end
    return ((x << 8) + t) * 13;
  #elif F_CPU == 1200000L
    // Each timer tick is 1/(1.2MHz/8) = 6.666us long. We multiply the timer0_overflow variable
    // by 256 (bitshift 8 times) and we add the current timer count TCNT0. Since each tick is 6.666us long,
    // we multiply by 7 at the end
    return ((x << 8) + t) * 7;
  #elif F_CPU == 1000000L
    // Each timer tick is 1/(1MHz/8) = 8us long. We multiply the timer0_overflow variable
    // by 256 (bitshift 8 times) and we add the current timer count TCNT0. Since each tick is 8us long,
    // we multiply by 8 at the end
    return ((x << 8) + t) * 8;  
  #elif F_CPU == 600000L
    // Each timer tick is 1/(600kHz/8) = 13.333us long. We multiply the timer0_overflow variable
    // by 256 (bitshift 8 times) and we add the current timer count TCNT0. Since each tick is 13.333us long,
    // we multiply by 13 at the end
    return ((x << 8) + t) * 13;    
 #endif

}
#endif // ENABLE_MICROS


// Wrapper to deal with _delay_ms(), which is an inline function
void delay(uint16_t ms)
{
  do
    _delay_ms(1);
  while(--ms);
    
}


// This init() function will be executed before the setup() function does
// Edit the core_settings.h file to choose what's going to be initialized 
// and what's not.
void init()
{
  #ifdef SETUP_PWM  
    // Set Timer0 prescaler
    #if defined(PWM_PRESCALER_DEFAULT)
      #if F_CPU >= 4800000L
        TCCR0B |= _BV(CS00) | _BV(CS01); // PWM frequency = (F_CPU/256) / 64
      #else  
        TCCR0B |= _BV(CS01);             // PWM frequency = (F_CPU/256) / 8
      #endif
    #elif defined(PWM_PRESCALER_NONE)    // PWM frequency = (F_CPU/256) / 1
      TCCR0B |= _BV(CS00);
    #elif  defined(PWM_PRESCALER_8)      // PWM frequency = (F_CPU/256) / 8
      TCCR0B |= _BV(CS01);
    #elif  defined(PWM_PRESCALER_64)     // PWM frequency = (F_CPU/256) / 64
      TCCR0B |= _BV(CS00) | _BV(CS01);
    #elif  defined(PWM_PRESCALER_256)    // PWM frequency = (F_CPU/256) / 256
      TCCR0B |= _BV(CS02);
    #elif  defined(PWM_PRESCALER_1024)   // PWM frequency = (F_CPU/256) / 1024
      TCCR0B |= _BV(CS00) | _BV(CS02);
    #endif
    
    // Set waveform generation mode
    #if defined(PWM_FAST)
      TCCR0A |= _BV(WGM00) | _BV(WGM01);
    #elif defined(PWM_PHASE_CORRECT)
      TCCR0A |= _BV(WGM00);
    #endif
  #endif  
  
  // Enable WDT interrupt and enable global interrupts  
  #ifdef ENABLE_MILLIS
    // Disable global interrupts      
    cli();
    // Reset watchdog
    wdt_reset();
    // Set up WDT interrupt with 16 ms prescaler
    WDTCR = _BV(WDTIE);
    // Enable global interrupts
    sei();
  #endif
  
  // WARNING! Enabling micros() will affect timing functions!
  #ifdef ENABLE_MICROS
    
    // Clear all Timer0 settings
    TCCR0B = 0;
    // Set a suited prescaler based on F_CPU
    #if F_CPU >= 4800000L
      TCCR0B |= _BV(CS00) | _BV(CS01); // F_CPU/64 
    #else  
      TCCR0B |= _BV(CS01);             // F_CPU/8
    #endif      
    // Enable overflow interrupt on Timer0
    TIMSK0 |= _BV(TOIE0);
    // Set timer0 couter to zero
    TCNT0 = 0; 
    // Turn on global interrupts
    sei();
  #endif
  
  // Enable the ADC and set the prescaler according to the clock frequency
  #ifdef SETUP_ADC
    ADMUX = 0;
    
    // Default ADC prescaler option
    #ifdef ADC_PRESCALER_DEFAULT
      // Less or equal to 200 kHz
      #if F_CPU <= 200000
        // Enable the ADC, keep the prescaler of 2 --> F_CPU / 2
        ADCSRA |= _BV(ADEN);      
      // Between 200 kHz and 1.2 MHz  
      #elif F_CPU <= 1200000
        // Enable the ADC, set the prescaler to 4 --> F_CPU / 4
        ADCSRA |= _BV(ADEN) | _BV(ADPS1);    
      // Between 1.2 MHz and 6.4 MHz
      #elif F_CPU <= 6400000
        // Enable the ADC, set the prescaler to 16 --> F_CPU / 16
        ADCSRA |= _BV(ADEN) | _BV(ADPS2);
      // More than 6.4 MHz
      #else
        // Enable the ADC, set the prescaler to 128 --> F_CPU / 128
        ADCSRA |= _BV(ADEN) | _BV(ADPS2) | _BV(ADPS1) | _BV(ADPS0); 
      #endif
      
    // ADC prescaler 2   
    #elif defined(ADC_PRESCALER_2)   
      ADCSRA |= _BV(ADEN);     
    // ADC prescaler 4
    #elif defined(ADC_PRESCALER_4)
      ADCSRA |= _BV(ADEN) | _BV(ADPS1);       
    // ADC prescaler 8
    #elif defined(ADC_PRESCALER_8)
      ADCSRA |= _BV(ADEN) | _BV(ADPS1) | _BV(ADPS0);     
    // ADC prescaler 16
    #elif defined(ADC_PRESCALER_16)
      ADCSRA |= _BV(ADEN) | _BV(ADPS2);
    // ADC prescaler 32
    #elif defined(ADC_PRESCALER_32)
      ADCSRA |= _BV(ADEN) | _BV(ADPS2) | _BV(ADPS0);
    // ADC prescaler 64
    #elif defined(ADC_PRESCALER_64)
      ADCSRA |= _BV(ADEN) | _BV(ADPS2) | _BV(ADPS1);
    // ADC prescaler 128
    #elif defined(ADC_PRESCALER_128)
      ADCSRA |= _BV(ADEN) | _BV(ADPS2) | _BV(ADPS1) | _BV(ADPS0);  
    #endif
  #endif
}

// Public Methods //////////////////////////////////////////////////////////////

/* default implementation: may be overridden */
void Print::write(const char *str)
{
  while (*str)
    write(*str++);
}

/* default implementation: may be overridden */
void Print::write(const uint8_t *buffer, size_t size)
{
  while (size--)
    write(*buffer++);
}

void Print::print(const char str[])
{
  write(str);
}

void Print::print(char c, int base)
{
  print((long) c, base);
}

void Print::print(unsigned char b, int base)
{
  print((unsigned long) b, base);
}

void Print::print(int n, int base)
{
  print((long) n, base);
}

void Print::print(unsigned int n, int base)
{
  print((unsigned long) n, base);
}

void Print::print(long n, int base)
{
  if (base == 0) {
    write(n);
  } else if (base == 10) {
    if (n < 0) {
      print('-');
      n = -n;
    }
    printNumber(n, 10);
  } else {
    printNumber(n, base);
  }
}

void Print::print(unsigned long n, int base)
{
  if (base == 0) write(n);
  else printNumber(n, base);
}

/*
void Print::print(double n, int digits)
{
  printFloat(n, digits);
}
*/
void Print::println(void)
{
  print('\r');
  print('\n');  
}

void Print::println(const char c[])
{
  print(c);
  println();
}

void Print::println(char c, int base)
{
  print(c, base);
  println();
}

void Print::println(unsigned char b, int base)
{
  print(b, base);
  println();
}

void Print::println(int n, int base)
{
  print(n, base);
  println();
}

void Print::println(unsigned int n, int base)
{
  print(n, base);
  println();
}

void Print::println(long n, int base)
{
  print(n, base);
  println();
}

void Print::println(unsigned long n, int base)
{
  print(n, base);
  println();
}

/*
void Print::println(double n, int digits)
{
  print(n, digits);
  println();
}
*/

// Private Methods /////////////////////////////////////////////////////////////

void Print::printNumber(unsigned long n, uint8_t base)
{
  unsigned char buf[8 * sizeof(long)]; // Assumes 8-bit chars. 
  unsigned long i = 0;

  if (n == 0) {
    print('0');
    return;
  } 

  while (n > 0) {
    buf[i++] = n % base;
    n /= base;
  }

  for (; i > 0; i--)
    print((char) (buf[i - 1] < 10 ?
      '0' + buf[i - 1] :
      'A' + buf[i - 1] - 10));
}

/*
void Print::printFloat(double number, uint8_t digits) 
{
 
  // Handle negative numbers
  if (number < 0.0)
  {
     print('-');
     number = -number;
  }

  // Round correctly so that print(1.999, 2) prints as "2.00"
  double rounding = 0.5;
  for (uint8_t i=0; i<digits; ++i)
    rounding /= 10.0;
  
  number += rounding;

  // Extract the integer part of the number and print it
  unsigned long int_part = (unsigned long)number;
  double remainder = number - (double)int_part;
  print(int_part);

  // Print the decimal point, but only if there are digits beyond
  if (digits > 0)
    print("."); 

  // Extract digits from the remainder one at a time
  while (digits-- > 0)
  {
    remainder *= 10.0;
    int toPrint = int(remainder);
    print(toPrint);
    remainder -= toPrint; 
  } 
}
*/

void analogReference(uint8_t mode)
{
   if(mode == INTERNAL)
      ADMUX |= _BV(REFS0);
   else
      ADMUX &= ~_BV(REFS0);
}


int16_t analogRead(uint8_t pin)
{
  uint8_t l,h;
  ADMUX = (ADMUX & _BV(REFS0)) | (pin & 0x03); // Setup ADC, preserve REFS0
  ADCSRA |= _BV(ADSC);  
  while(ADCSRA & _BV(ADSC)); // Wait for conversion
  l = ADCL;  // Read and return 10 bit result
  h = ADCH;
  return (h << 8)|l; 
}

void pinMode(uint8_t pin, uint8_t mode)
{
  // SAFEMODE prevents you from inserting a pin number out of range
  #ifdef SAFEMODE
    if(pin > 5)
      return;
  #endif
  
  if(mode == OUTPUT) // Pin as output
    DDRB |= _BV(pin);
      
  else // Pin as input or input pullup
  {
    DDRB &= ~_BV(pin); // Set pin as input
    if(mode == INPUT_PULLUP)
      PORTB |= _BV(pin); // Enable pullup resistors
  }
}


void digitalWrite(uint8_t pin, uint8_t val)
{
  // SAFEMODE prevents you from inserting a pin number out of range, and disables PWM if turned on
  #if defined(SAFEMODE)
    if(pin > 5)
      return;
    if(pin < 2)
      turnOffPWM(pin); // If it's a PWM pin, make sure PWM is off
  #endif  
    
  if(val)
    PORTB |= _BV(pin);  // Set pin high
  else
    PORTB &= ~_BV(pin); // Set pin low
}


uint8_t digitalRead(uint8_t pin)
{
  // SAFEMODE prevents you from inserting a pin number out of range, and disables PWM if turned on
  #ifdef SAFEMODE
    if(pin > 5)
      return 0;
    if(pin < 2)
      turnOffPWM(pin); // If it's PWM pin, makes sure the PWM is off
  #endif
  
  return !!(PINB & _BV(pin));
}

// COMPILER_LTO is automatically defined in the platforms.txt when an LTO option is selected in the GCC flags menu
#if defined(COMPILER_LTO) // Choose the function below if LTO is enabled

  // This pulseIn function is a complete rewrite of the original one, 
  // and does not depend on micros() to work. 
  // However it will only work properly with LTO enabled.
  uint32_t pulseIn(uint8_t pin, uint8_t state, uint32_t timeout) 
  {  
    
    #if defined(SAFEMODE)
      if(pin > 5) // Return if pin number is too high
        return;
      if(pin < 2)
        turnOffPWM(c); // If it's a PWM pin, make sure PWM is off
    #endif
    
   
    // Convert the timeout from microseconds to a number of times through
    // the initial loop; it takes 16 clock cycles per iteration.
    uint32_t numloops = 0;
    uint32_t maxloops = microsecondsToClockCycles(timeout) >> 4; // Same as dividing by 16
    uint32_t width = 0; // Keep initialization out of time critical area

    // Wait for any previous pulse to end
    while(!!(PINB & _BV(pin)) == state)
    {
      if(numloops++ == maxloops) {return 0;}
      asm("nop \n");  
      asm("nop \n");
    }
    // Wait for the pulse to start
    while(!!(PINB & _BV(pin)) != state)
    {
      if(numloops++ == maxloops) {return 0;}
      asm("nop \n");  
      asm("nop \n");
      asm("nop \n");
    }
    // Wait for the pulse to stop This loop is 16 instructions long
    while(!!(PINB & _BV(pin)) == state)
    {
      if(numloops++ == maxloops) {return 0;}           
      width++;
      asm("nop \n");  
      asm("nop \n");  
      asm("nop \n"); 
    }

    // Convert the reading to microseconds. 
    return clockCyclesToMicroseconds(width << 4); // Multiply by 16
}


#else // Choose the function below if LTO is disabled
  
  // This pulseIn function is based on micros, and _will_ be inaccurate
  // if F_CPU doesn't divide evenly by 64
  uint32_t pulseIn(uint8_t pin, uint8_t stat, uint32_t timeout)
  { 
  
   #if defined(SAFEMODE)
     if(pin > 5) // Return if pin number is too high
       return;
     if(pin < 2)
       turnOffPWM(c); // If it's a PWM pin, make sure PWM is off
    #endif
  
    uint32_t st,to;
    to = micros();
    while(!!(PINB & _BV(pin)) == stat){if((micros() - to) > timeout){return 0;}}
    while(!!(PINB & _BV(pin)) != stat){if((micros() - to) > timeout){return 0;}}
    st = micros();
    while(!!(PINB & _BV(pin)) == stat){if((micros() - to) > timeout){return 0;}}
    return micros()-st;
  }
#endif

void turnOffPWM(uint8_t pin)
{
  if(pin == 0)
    TCCR0A &= ~_BV(COM0A1);
  else if(pin == 1)
    TCCR0A &= ~_BV(COM0B1);
}


void analogWrite(uint8_t pin, uint8_t val)
{
  // SAFEMODE prevents you from inserting a pin number out of range
  #ifdef SAFEMODE
    DDRB |= _BV(pin & 0x02); // Set the correct pin as output
  #endif
  
  // Handle off condition  
  if(val == 0)
  {
    turnOffPWM(pin);    // Turn off PWM
    PORTB &= ~_BV(pin); // Set pin low
  }
  
  // Handle on condition
  else if(val == 255) 
  {
    turnOffPWM(pin);   // Turn off PWM
    PORTB |= _BV(pin); // Set pin high
  }
  
  // Otherwise setup the appropriate timer compare
  else
  { 
    if(pin == 1)    
    {
      TCCR0A |= _BV(COM0B1);
      OCR0B = val;
    }
    
    // SAFEMODE prevents you from inserting a pin number out of range
    #ifdef SAFEMODE
    else if(pin == 0)
    #else
    else // We're saving a few bytes by not asking if pin = 0
    #endif
    {
      TCCR0A |= _BV(COM0A1);
      OCR0A = val;
    }
  }
}

uint8_t shiftIn(uint8_t dataPin, uint8_t clockPin, uint8_t bitOrder)
{  
  #if defined(SAFEMODE)
    if(clockPin > 5 || datapin > 5) // Return if pin number is too high
      return;
    if(clockPin < 2)
      turnOffPWM(clockPin); // If it's a PWM pin, make sure PWM is off
    else if(dataPin < 2)
      turnOffPWM(dataPin);  // If it's a PWM pin, make sure PWM is off
  #endif  
 
  uint8_t value = 0;
  
  for(uint8_t i = 0; i < 8; ++i)
  {
    PORTB |= _BV(clockPin);  // Set clockPin high
    value |= (!!(PINB & _BV(dataPin)) << ((bitOrder == LSBFIRST) ? i : 7 - i)); // clock in to dataPin
    PORTB &= ~_BV(clockPin); // Set clockPin low
  }
  return value;
}


void shiftOut(uint8_t dataPin, uint8_t clockPin, uint8_t bitOrder, uint8_t val)
{
  
  #if defined(SAFEMODE)
    if(clockPin > 5 || dataPin > 5) // Return if pin number is too high
      return;
    if(clockPin < 2)
      turnOffPWM(clockPin); // If it's a PWM pin, make sure PWM is off
    else if(dataPin < 2)
      turnOffPWM(dataPin);  // If it's a PWM pin, make sure PWM is off
  #endif    
  
  for(uint8_t i = 0; i < 8; i++)  
  {
    if(bitOrder == LSBFIRST)
      (!!(val & _BV(i))) ? (PORTB |= _BV(dataPin)) : (PORTB &= ~_BV(dataPin));
    else
      (!!(val & _BV(7 - i))) ? (PORTB |= _BV(dataPin)) : (PORTB &= ~_BV(dataPin));

    PORTB |= _BV(clockPin);  // Set pin clockPin high
    asm("nop");              // Wait one instruction
    PORTB &= ~_BV(clockPin); // Set clockPin low
  }
}

static volatile uint32_t CurrentToneDuration = 0;
static volatile uint8_t  CurrentTonePin      = 255;
static volatile uint8_t  CurrentToneMidpoint = 0;

#ifndef TONE_MIN_FREQ
  #define TONE_MIN_FREQ 130 // 130.81 = C3
#endif

#ifndef TONE_MAX_FREQ
  #define TONE_MAX_FREQ 2093 // 2093.0 = C6
#endif


void tone(const uint8_t pin, const uint16_t frequency, const uint32_t length)
{
  if(frequency == 0) 
    return noTone(pin);

  uint16_t  prescaleDivider = 1; // The divider increases by powers of 2
  uint8_t   prescaleBitMask = 1; // The bitmask only increments unitarily
  uint32_t  ticksPerMs      = F_CPU / 1000;
  
  
  // The numbers in each if statement are the lowest frequency that can be achieved
  // with the prescale inside the if statement
  //
  // eg: the frequency can be viewed as a number of transitions equal to the 
  //     frequency * ([LOW]-transition-[HIGH])
  //     (we ignore the extra transition between cycles, happens anyway, err, I think, maybe, not sure)
  //     the longer the time between transitions the lower the frequency
  //     the maximum length we can get is 255 ticks
  //     the minimum length we can get is 1 tick
  //
  //     therefore minimum is CPU_FREQ / Prescale / 255
  //               maximum is CPU_FREQ / Prescale / 1
  
  // We will add/remove 1 hz to account for rounding here
  
  #define TONE_MIN_FREQ_FOR_PRESCALE(PS) (((F_CPU / PS) / 255) + 1)
  #define TONE_MAX_FREQ_FOR_PRESCALE(PS) (((F_CPU / PS) / 1)   - 1)
  
  #define TONE_RANGE_ACTIVE_FOR_PRESCALE(PS) ( TONE_MAX_FREQ >= TONE_MIN_FREQ_FOR_PRESCALE(PS) && TONE_MIN_FREQ <= TONE_MAX_FREQ_FOR_PRESCALE(PS) )
    
  if(TONE_RANGE_ACTIVE_FOR_PRESCALE(1) && frequency >= TONE_MIN_FREQ_FOR_PRESCALE(1))     // (F_CPU / 1) / 255
  {
    prescaleDivider = 1;
    ticksPerMs      = F_CPU / 1000;
    prescaleBitMask = 1;
  }
  else if(TONE_RANGE_ACTIVE_FOR_PRESCALE(8) && frequency >= TONE_MIN_FREQ_FOR_PRESCALE(8))  // (F_CPU / 8) / 255
  {
    prescaleDivider = 8;
    ticksPerMs      = (F_CPU/8) / 1000;
    prescaleBitMask = 2;
  }      
  else if(TONE_RANGE_ACTIVE_FOR_PRESCALE(64) && frequency >= TONE_MIN_FREQ_FOR_PRESCALE(64))  // (F_CPU / 64) / 255
  {
    prescaleDivider = 64;
    ticksPerMs      = (F_CPU/64) / 1000;
    prescaleBitMask = 3;
  }  
  else if(TONE_RANGE_ACTIVE_FOR_PRESCALE(256) && frequency >= TONE_MIN_FREQ_FOR_PRESCALE(256))  // (F_CPU / 256) / 255
  {
    prescaleDivider = 256;
    ticksPerMs      = (F_CPU/256) / 1000;
    prescaleBitMask = 4;
  }      
  else if(TONE_RANGE_ACTIVE_FOR_PRESCALE(1024)  && frequency >= TONE_MIN_FREQ_FOR_PRESCALE(1024))  // (F_CPU / 1024) / 255
  {
    prescaleDivider = 1024;
    ticksPerMs      = (F_CPU/1024) / 1000;
    prescaleBitMask = 5;
  }
  
  toneRaw(pin, ((F_CPU / prescaleDivider) / frequency), length ? length * ticksPerMs : ~(0UL), prescaleBitMask);
}


void toneRaw(uint8_t pin, uint8_t midPoint, uint32_t lengthTicks, uint8_t prescaleBitMask) 
{

  // Because the t13 is so limited in flash space, this really is little more than
  // a because-I-can excercise in futility.
  //
  // Because we can't do division (way too heavy) an inline function is used to 
  // do pre-calculation of the midPoint (of the timer, where we toggle the pin)
  // the number of ticks, and the prescale bitmask.  Naturally this is only 
  // going to work when tone is fed a constant frequency and length!
  
  // Because we only have one timer, we can't just use millis() to 
  // do tone duration, since it won't be accurate.
  //
  // So instead we calculate how many ticks the tone should go for and subtract
  // ticks as we hit the mid-point.
    
  CurrentToneDuration = lengthTicks;

  // Are we already playing that tone, if so, just keep doing that
  // otherwise we would make a clicking sound.
  if(pin == CurrentTonePin && midPoint == CurrentToneMidpoint) 
    return;
  
  // The official Arduino tone() sets it as output for you so we will also.
  if(pin != CurrentTonePin)
  {
    CurrentTonePin = pin;
    pinMode(pin, OUTPUT);    
  }
    
  // Shut down interrupts while we fiddle about with the timer.
  cli();
  
  TCCR0B &= ~0b00000111; // Turn off the timer before changing anytning
  TCNT0   = 0;           // Timer counter back to zero
  
  // Set the comparison, we will flip the bit every time this is hit      
  // (actually, this will set TOP of the timer and we flip on the overflow) 
  OCR0A = midPoint;
  CurrentToneMidpoint = midPoint;
  
  // Enable the overflow interrupt
  TIMSK0 |= _BV(OCIE0A);
  
  // Start playing and record time
  digitalWrite(pin, HIGH);   
  
  // Start the timer    
  TCCR0A = 0b00000011;  
  TCCR0B = 0b00001000 | prescaleBitMask;
  
  sei(); // We **have** to enable interrupts here even if they were disabled coming in,
         // otherwise it's not going to do anything.  Hence not saving/restoring SREG.
}


void noTone(uint8_t pin) 
{
  // Disable the interrupt
  // Note we can leave the rest of the timer setup as is, turnOnPWM() will
  // fix it for itself next time you analogWrite() if you need to.
  TIMSK0 &= ~_BV(OCIE0A);
  
  // Pin goes back to input state  
  pinMode(pin == 255 ? CurrentTonePin : pin, INPUT);
  
  // And make sure we will reset it to output state next time you call
  // tone() by treating it as a new pin
  CurrentTonePin = 255;  
}


// This function will reset Timer0 back to its default setting
void stopTone()
{
  // Resets timer0 to it's default value defined in core_settings.h
  #ifdef SETUP_PWM  
    // Set Timer0 prescaler
    #if defined(PWM_PRESCALER_DEFAULT)
      #if F_CPU >= 4800000L
        TCCR0B |= _BV(CS00) | _BV(CS01); // PWM frequency = (F_CPU/256) / 64
      #else  
        TCCR0B |= _BV(CS01);             // PWM frequency = (F_CPU/256) / 8
      #endif
    #elif defined(PWM_PRESCALER_NONE)    // PWM frequency = (F_CPU/256) / 1
      TCCR0B |= _BV(CS00);
    #elif  defined(PWM_PRESCALER_8)      // PWM frequency = (F_CPU/256) / 8
      TCCR0B |= _BV(CS01);
    #elif  defined(PWM_PRESCALER_64)     // PWM frequency = (F_CPU/256) / 64
      TCCR0B |= _BV(CS00) | _BV(CS01);
    #elif  defined(PWM_PRESCALER_256)    // PWM frequency = (F_CPU/256) / 256
      TCCR0B |= _BV(CS02);
    #elif  defined(PWM_PRESCALER_1024)   // PWM frequency = (F_CPU/256) / 1024
      TCCR0B |= _BV(CS00) | _BV(CS02);
    #endif
    
    // Set waveform generation mode
    #if defined(PWM_FAST)
      TCCR0A |= _BV(WGM00) | _BV(WGM01);
    #elif defined(PWM_PHASE_CORRECT)
      TCCR0A |= _BV(WGM00);
    #endif
  #endif  
  
  // Override previous PWM setup if micros() is enabled
  #ifdef ENABLE_MICROS     
    // Clear all Timer0 settings
    TCCR0B = 0;
    // Set a suited prescaler based on F_CPU
    #if F_CPU >= 4800000L
      TCCR0B |= _BV(CS00) | _BV(CS01); // F_CPU/64 
    #else  
      TCCR0B |= _BV(CS01);             // F_CPU/8
    #endif      
    // Enable overflow interrupt on Timer0
    TIMSK0 |= _BV(TOIE0);
    // Set timer0 couter to zero
    TCNT0 = 0;
    // Clear Timer0 overflow counter
    timer0_overflow = 0;
    // Turn on global interrupts
    sei();
  #endif
}


ISR(TIM0_COMPA_vect) 
{  
  // Toggle the pin, most AVR can toggle an output pin by writing a 1 to the input 
  // register bit for that pin.
  PINB = _BV(CurrentTonePin);
  
  // If we have played this tone for the requested duration, stop playing it.
  if (CurrentToneDuration < CurrentToneMidpoint)
    noTone(255); 
  
  CurrentToneDuration -= CurrentToneMidpoint;
  TCNT0 = 0; // Restart timer
}

extern "C" {
  #include <stdlib.h>
  #include <stdint.h>
}


void randomSeed(uint16_t seed)
{
  if (seed != 0) 
    srandom(seed);
}


int32_t random(int32_t howbig)
{
  if (howbig == 0) 
    return 0;
  
  return random() % howbig;
}


int32_t random(int32_t howsmall, int32_t howbig)
{
  if (howsmall >= howbig) 
    return howsmall;
  
  int32_t diff = howbig - howsmall;
  return random(diff) + howsmall;
}


uint16_t makeWord(uint16_t w) 
{ 
  return w; 
}


uint16_t makeWord(uint8_t h, uint8_t l) 
{ 
  return (h << 8) | l; 
}