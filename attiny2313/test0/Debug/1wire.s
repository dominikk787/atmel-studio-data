	.file	"1wire.c"
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.oneWireSendZero,"ax",@progbits
.global	oneWireSendZero
	.type	oneWireSendZero, @function
oneWireSendZero:
.LFB6:
	.file 1 ".././1wire.c"
	.loc 1 5 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 6 0
/* #APP */
 ;  6 ".././1wire.c" 1
	cli
 ;  0 "" 2
	.loc 1 7 0
/* #NOAPP */
	sbi 0x1a,0
.LVL0:
.LBB22:
.LBB23:
	.file 2 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\util\\delay.h"
	.loc 2 276 0
	ldi r24,lo8(-96)
1:	dec r24
	brne 1b
.LVL1:
.LBE23:
.LBE22:
	.loc 1 9 0
	cbi 0x1a,0
.LVL2:
.LBB24:
.LBB25:
	.loc 2 276 0
	ldi r24,lo8(26)
1:	dec r24
	brne 1b
	rjmp .
.LVL3:
.LBE25:
.LBE24:
	.loc 1 11 0
/* #APP */
 ;  11 ".././1wire.c" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	ret
	.cfi_endproc
.LFE6:
	.size	oneWireSendZero, .-oneWireSendZero
	.section	.text.oneWireSendOne,"ax",@progbits
.global	oneWireSendOne
	.type	oneWireSendOne, @function
oneWireSendOne:
.LFB7:
	.loc 1 14 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 15 0
/* #APP */
 ;  15 ".././1wire.c" 1
	cli
 ;  0 "" 2
	.loc 1 16 0
/* #NOAPP */
	sbi 0x1a,0
.LVL4:
.LBB26:
.LBB27:
	.loc 2 276 0
	ldi r24,lo8(16)
1:	dec r24
	brne 1b
.LVL5:
.LBE27:
.LBE26:
	.loc 1 18 0
	cbi 0x1a,0
.LVL6:
.LBB28:
.LBB29:
	.loc 2 276 0
	ldi r24,lo8(-86)
1:	dec r24
	brne 1b
	rjmp .
.LVL7:
.LBE29:
.LBE28:
	.loc 1 20 0
/* #APP */
 ;  20 ".././1wire.c" 1
	sei
 ;  0 "" 2
/* #NOAPP */
	ret
	.cfi_endproc
.LFE7:
	.size	oneWireSendOne, .-oneWireSendOne
	.section	.text.oneWireReset,"ax",@progbits
.global	oneWireReset
	.type	oneWireReset, @function
oneWireReset:
.LFB8:
	.loc 1 23 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 24 0
/* #APP */
 ;  24 ".././1wire.c" 1
	cli
 ;  0 "" 2
.LVL8:
	.loc 1 26 0
/* #NOAPP */
	sbi 0x1a,0
.LVL9:
.LBB30:
.LBB31:
	.loc 2 276 0
	ldi r24,lo8(959)
	ldi r25,hi8(959)
1:	sbiw r24,1
	brne 1b
	rjmp .
	nop
.LVL10:
.LBE31:
.LBE30:
	.loc 1 28 0
	cbi 0x1a,0
.LVL11:
.LBB32:
.LBB33:
	.loc 2 276 0
	ldi r25,lo8(-70)
1:	dec r25
	brne 1b
	rjmp .
.LVL12:
.LBE33:
.LBE32:
	.loc 1 30 0
	in r24,0x19
	com r24
	andi r24,lo8(1)
.LVL13:
.LBB34:
.LBB35:
	.loc 2 276 0
	ldi r30,lo8(819)
	ldi r31,hi8(819)
1:	sbiw r30,1
	brne 1b
	rjmp .
	nop
.LVL14:
.LBE35:
.LBE34:
	.loc 1 32 0
/* #APP */
 ;  32 ".././1wire.c" 1
	sei
 ;  0 "" 2
	.loc 1 34 0
/* #NOAPP */
	ret
	.cfi_endproc
.LFE8:
	.size	oneWireReset, .-oneWireReset
	.section	.text.oneWireReceiveBit,"ax",@progbits
.global	oneWireReceiveBit
	.type	oneWireReceiveBit, @function
oneWireReceiveBit:
.LFB9:
	.loc 1 36 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 37 0
/* #APP */
 ;  37 ".././1wire.c" 1
	cli
 ;  0 "" 2
.LVL15:
	.loc 1 39 0
/* #NOAPP */
	sbi 0x1a,0
.LVL16:
.LBB36:
.LBB37:
	.loc 2 276 0
	ldi r24,lo8(16)
1:	dec r24
	brne 1b
.LVL17:
.LBE37:
.LBE36:
	.loc 1 41 0
	cbi 0x1a,0
.LVL18:
.LBB38:
.LBB39:
	.loc 2 276 0
	ldi r25,lo8(24)
1:	dec r25
	brne 1b
.LVL19:
.LBE39:
.LBE38:
	.loc 1 43 0
	in r24,0x19
.LVL20:
.LBB40:
.LBB41:
	.loc 2 276 0
	ldi r25,lo8(-110)
1:	dec r25
	brne 1b
	rjmp .
.LVL21:
.LBE41:
.LBE40:
	.loc 1 45 0
/* #APP */
 ;  45 ".././1wire.c" 1
	sei
 ;  0 "" 2
	.loc 1 47 0
/* #NOAPP */
	andi r24,lo8(1)
.LVL22:
	ret
	.cfi_endproc
.LFE9:
	.size	oneWireReceiveBit, .-oneWireReceiveBit
	.section	.text.oneWireSendByte,"ax",@progbits
.global	oneWireSendByte
	.type	oneWireSendByte, @function
oneWireSendByte:
.LFB10:
	.loc 1 49 0
	.cfi_startproc
.LVL23:
	push r28
.LCFI0:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI1:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
	mov r29,r24
.LVL24:
	.loc 1 49 0
	ldi r28,lo8(8)
.LVL25:
.L8:
.LBB42:
	.loc 1 51 0
	sbrs r29,0
	rjmp .L6
	.loc 1 52 0
	rcall oneWireSendOne
.LVL26:
	rjmp .L7
.L6:
	.loc 1 54 0
	rcall oneWireSendZero
.LVL27:
.L7:
	.loc 1 56 0 discriminator 2
	lsr r29
.LVL28:
	subi r28,lo8(-(-1))
.LVL29:
	.loc 1 50 0 discriminator 2
	brne .L8
/* epilogue start */
.LBE42:
	.loc 1 58 0
	pop r29
.LVL30:
	pop r28
.LVL31:
	ret
	.cfi_endproc
.LFE10:
	.size	oneWireSendByte, .-oneWireSendByte
	.section	.text.oneWireReceiveByte,"ax",@progbits
.global	oneWireReceiveByte
	.type	oneWireReceiveByte, @function
oneWireReceiveByte:
.LFB11:
	.loc 1 60 0
	.cfi_startproc
	push r28
.LCFI2:
	.cfi_def_cfa_offset 3
	.cfi_offset 28, -2
	push r29
.LCFI3:
	.cfi_def_cfa_offset 4
	.cfi_offset 29, -3
/* prologue: function */
/* frame size = 0 */
/* stack size = 2 */
.L__stack_usage = 2
.LVL32:
	.loc 1 60 0
	ldi r29,lo8(8)
	.loc 1 61 0
	ldi r28,0
.LVL33:
.L13:
.LBB43:
	.loc 1 63 0
	lsr r28
.LVL34:
	.loc 1 64 0
	rcall oneWireReceiveBit
.LVL35:
	cpse r24,__zero_reg__
	.loc 1 64 0 is_stmt 0 discriminator 1
	ori r28,lo8(-128)
.LVL36:
.L12:
	subi r29,lo8(-(-1))
.LVL37:
	.loc 1 62 0 is_stmt 1 discriminator 2
	brne .L13
.LBE43:
	.loc 1 67 0
	mov r24,r28
/* epilogue start */
	pop r29
.LVL38:
	pop r28
.LVL39:
	ret
	.cfi_endproc
.LFE11:
	.size	oneWireReceiveByte, .-oneWireReceiveByte
	.section	.text.oneWireComputeCRC8,"ax",@progbits
.global	oneWireComputeCRC8
	.type	oneWireComputeCRC8, @function
oneWireComputeCRC8:
.LFB12:
	.loc 1 69 0
	.cfi_startproc
.LVL40:
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 69 0
	ldi r25,lo8(8)
.LVL41:
.L21:
	.loc 1 75 0
	mov r18,r24
	eor r18,r22
	sbrc r18,0
	rjmp .L19
	.loc 1 76 0
	lsr r23
	ror r22
.LVL42:
	rjmp .L20
.LVL43:
.L19:
	.loc 1 79 0
	ldi r18,24
	eor r22,r18
.LVL44:
	.loc 1 80 0
	lsr r23
	ror r22
.LVL45:
	.loc 1 81 0
	ori r22,128
.LVL46:
.L20:
	.loc 1 83 0 discriminator 2
	lsr r24
.LVL47:
	subi r25,lo8(-(-1))
.LVL48:
	.loc 1 73 0 discriminator 2
	brne .L21
	.loc 1 86 0
	mov r24,r22
.LVL49:
	ret
	.cfi_endproc
.LFE12:
	.size	oneWireComputeCRC8, .-oneWireComputeCRC8
	.section	.text.oneWireSearchRom,"ax",@progbits
.global	oneWireSearchRom
	.type	oneWireSearchRom, @function
oneWireSearchRom:
.LFB13:
	.loc 1 89 0
	.cfi_startproc
.LVL50:
	push r11
.LCFI4:
	.cfi_def_cfa_offset 3
	.cfi_offset 11, -2
	push r12
.LCFI5:
	.cfi_def_cfa_offset 4
	.cfi_offset 12, -3
	push r13
.LCFI6:
	.cfi_def_cfa_offset 5
	.cfi_offset 13, -4
	push r14
.LCFI7:
	.cfi_def_cfa_offset 6
	.cfi_offset 14, -5
	push r15
.LCFI8:
	.cfi_def_cfa_offset 7
	.cfi_offset 15, -6
	push r16
.LCFI9:
	.cfi_def_cfa_offset 8
	.cfi_offset 16, -7
	push r17
.LCFI10:
	.cfi_def_cfa_offset 9
	.cfi_offset 17, -8
	push r28
.LCFI11:
	.cfi_def_cfa_offset 10
	.cfi_offset 28, -9
	push r29
.LCFI12:
	.cfi_def_cfa_offset 11
	.cfi_offset 29, -10
/* prologue: function */
/* frame size = 0 */
/* stack size = 9 */
.L__stack_usage = 9
	movw r16,r24
	mov r12,r22
.LVL51:
	.loc 1 96 0
	rcall oneWireReset
.LVL52:
	.loc 1 97 0
	ldi r24,lo8(-16)
	rcall oneWireSendByte
.LVL53:
	clr r14
	inc r14
	mov r15,__zero_reg__
	.loc 1 92 0
	ldi r28,lo8(1)
	.loc 1 91 0
	ldi r29,0
	.loc 1 117 0
	mov __tmp_reg__,r12
	lsl r0
	sbc r13,r13
.LVL54:
.L35:
	.loc 1 102 0
	rcall oneWireReceiveBit
.LVL55:
	mov r11,r24
.LVL56:
	.loc 1 103 0
	rcall oneWireReceiveBit
.LVL57:
	.loc 1 104 0
	tst r11
	breq .L24
	.loc 1 104 0 is_stmt 0 discriminator 1
	cpse r24,__zero_reg__
	rjmp .L42
	.loc 1 110 0 is_stmt 1
	movw r30,r16
	ld r24,Z
.LVL58:
	or r24,r28
	st Z,r24
	rjmp .L29
.LVL59:
.L24:
	movw r30,r16
	ld r25,Z
	.loc 1 107 0
	tst r24
	breq .L39
	.loc 1 112 0
	mov r24,r28
.LVL60:
	com r24
	and r25,r24
	rjmp .L40
.LVL61:
.L39:
	.loc 1 117 0
	cp r14,r12
	cpc r15,r13
	brne .L30
	.loc 1 118 0
	or r25,r28
.LVL62:
.L40:
	movw r30,r16
	st Z,r25
	rjmp .L29
.LVL63:
.L30:
	.loc 1 121 0
	cp r12,r14
	cpc r13,r15
	brge .L31
	.loc 1 122 0
	mov r24,r28
.LVL64:
	com r24
	and r25,r24
	movw r30,r16
	st Z,r25
.LVL65:
	rjmp .L41
.LVL66:
.L31:
	.loc 1 126 0
	and r25,r28
	brne .L29
.LVL67:
.L41:
	mov r29,r14
.L29:
.LVL68:
	.loc 1 133 0
	movw r30,r16
	ld r24,Z
	and r24,r28
	breq .L32
	.loc 1 134 0
	rcall oneWireSendOne
.LVL69:
	rjmp .L33
.L32:
	.loc 1 137 0
	rcall oneWireSendZero
.LVL70:
.L33:
	.loc 1 143 0
	lsl r28
.LVL71:
	.loc 1 144 0
	brne .L34
.LVL72:
	.loc 1 147 0
	subi r16,-1
	sbci r17,-1
.LVL73:
	.loc 1 146 0
	ldi r28,lo8(1)
.LVL74:
.L34:
	ldi r31,-1
	sub r14,r31
	sbc r15,r31
.LVL75:
	.loc 1 100 0
	ldi r24,65
	cp r14,r24
	cpc r15,__zero_reg__
	brne .L35
	.loc 1 150 0
	mov r24,r29
	rjmp .L25
.LVL76:
.L42:
	.loc 1 106 0
	ldi r24,lo8(-1)
.LVL77:
.L25:
/* epilogue start */
	.loc 1 151 0
	pop r29
.LVL78:
	pop r28
.LVL79:
	pop r17
	pop r16
.LVL80:
	pop r15
	pop r14
	pop r13
	pop r12
.LVL81:
	pop r11
.LVL82:
	ret
	.cfi_endproc
.LFE13:
	.size	oneWireSearchRom, .-oneWireSearchRom
	.section	.text.ds18b20ReadTemp,"ax",@progbits
.global	ds18b20ReadTemp
	.type	ds18b20ReadTemp, @function
ds18b20ReadTemp:
.LFB14:
	.loc 1 153 0
	.cfi_startproc
	push r12
.LCFI13:
	.cfi_def_cfa_offset 3
	.cfi_offset 12, -2
	push r13
.LCFI14:
	.cfi_def_cfa_offset 4
	.cfi_offset 13, -3
	push r14
.LCFI15:
	.cfi_def_cfa_offset 5
	.cfi_offset 14, -4
	push r15
.LCFI16:
	.cfi_def_cfa_offset 6
	.cfi_offset 15, -5
	push r16
.LCFI17:
	.cfi_def_cfa_offset 7
	.cfi_offset 16, -6
	push r17
.LCFI18:
	.cfi_def_cfa_offset 8
	.cfi_offset 17, -7
	push r28
.LCFI19:
	.cfi_def_cfa_offset 9
	.cfi_offset 28, -8
	push r29
.LCFI20:
	.cfi_def_cfa_offset 10
	.cfi_offset 29, -9
	in r28,__SP_L__
	clr r29
.LCFI21:
	.cfi_def_cfa_register 28
	subi r28,lo8(-(-9))
.LCFI22:
	.cfi_def_cfa_offset 19
	out __SP_L__,r28
/* prologue: function */
/* frame size = 9 */
/* stack size = 17 */
.L__stack_usage = 17
	.loc 1 154 0
	rcall oneWireReset
.LVL83:
	.loc 1 155 0
	ldi r24,lo8(-52)
	rcall oneWireSendByte
.LVL84:
	.loc 1 156 0
	ldi r24,lo8(68)
	rcall oneWireSendByte
.LVL85:
.L44:
	.loc 1 157 0 discriminator 1
	rcall oneWireReceiveBit
.LVL86:
	tst r24
	breq .L44
	.loc 1 158 0
	rcall oneWireReset
.LVL87:
	.loc 1 159 0
	ldi r24,lo8(-52)
	rcall oneWireSendByte
.LVL88:
	.loc 1 160 0
	ldi r24,lo8(-66)
	rcall oneWireSendByte
.LVL89:
	movw r16,r28
	subi r16,-1
	sbci r17,-1
	movw r12,r28
	ldi r24,10
	add r12,r24
	adc r13,__zero_reg__
	movw r14,r16
.LVL90:
.L45:
.LBB44:
	.loc 1 168 0 discriminator 3
	rcall oneWireReceiveByte
.LVL91:
	movw r30,r14
	st Z+,r24
	movw r14,r30
	.loc 1 167 0 discriminator 3
	cp r30,r12
	cpc r31,r13
	brne .L45
	movw r14,r28
	ldi r31,9
	add r14,r31
	adc r15,__zero_reg__
	.loc 1 167 0 is_stmt 0
	ldi r22,0
	ldi r23,0
.L46:
.LVL92:
.LBE44:
.LBB45:
	.loc 1 173 0 is_stmt 1 discriminator 3
	movw r30,r16
	ld r24,Z+
	movw r16,r30
	rcall oneWireComputeCRC8
.LVL93:
	mov r22,r24
	ldi r23,0
.LVL94:
	.loc 1 172 0 discriminator 3
	cp r16,r14
	cpc r17,r15
	brne .L46
.LBE45:
	.loc 1 174 0
	ldd r24,Y+9
	ldi r25,0
	cp r22,r24
	cpc r23,r25
	brne .L48
	.loc 1 174 0 is_stmt 0 discriminator 1
	ldd r24,Y+1
	ldd r25,Y+2
	ldi r22,lo8(10)
	ldi r23,0
.LVL95:
	rcall __mulhi3
	ldi r18,4
	1:
	asr r25
	ror r24
	dec r18
	brne 1b
	rjmp .L47
.LVL96:
.L48:
	.loc 1 175 0 is_stmt 1
	ldi r24,lo8(-56)
	ldi r25,0
.LVL97:
.L47:
/* epilogue start */
	.loc 1 176 0
	subi r28,lo8(-(9))
	out __SP_L__,r28
	pop r29
	pop r28
	pop r17
	pop r16
	pop r15
	pop r14
	pop r13
	pop r12
	ret
	.cfi_endproc
.LFE14:
	.size	ds18b20ReadTemp, .-ds18b20ReadTemp
	.text
.Letext0:
	.file 3 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h"
	.file 4 ".././1wire.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x6b6
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF43
	.byte	0xc
	.long	.LASF44
	.long	.LASF45
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.long	.LASF0
	.byte	0x3
	.byte	0x7d
	.long	0x34
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.long	.LASF2
	.uleb128 0x2
	.long	.LASF1
	.byte	0x3
	.byte	0x7e
	.long	0x46
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.long	.LASF3
	.uleb128 0x2
	.long	.LASF4
	.byte	0x3
	.byte	0x7f
	.long	0x58
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x2
	.long	.LASF5
	.byte	0x3
	.byte	0x80
	.long	0x6a
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF6
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.long	.LASF8
	.byte	0x3
	.byte	0x82
	.long	0x83
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.long	.LASF9
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.long	.LASF10
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.long	.LASF11
	.uleb128 0x5
	.long	.LASF46
	.byte	0x9
	.byte	0x4
	.byte	0x11
	.long	0xeb
	.uleb128 0x6
	.long	.LASF12
	.byte	0x4
	.byte	0x12
	.long	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0
	.uleb128 0x6
	.long	.LASF13
	.byte	0x4
	.byte	0x13
	.long	0x4d
	.byte	0x2
	.byte	0x23
	.uleb128 0x2
	.uleb128 0x6
	.long	.LASF14
	.byte	0x4
	.byte	0x14
	.long	0x3b
	.byte	0x2
	.byte	0x23
	.uleb128 0x4
	.uleb128 0x6
	.long	.LASF15
	.byte	0x4
	.byte	0x15
	.long	0xeb
	.byte	0x2
	.byte	0x23
	.uleb128 0x5
	.uleb128 0x7
	.string	"crc"
	.byte	0x4
	.byte	0x16
	.long	0x3b
	.byte	0x2
	.byte	0x23
	.uleb128 0x8
	.byte	0
	.uleb128 0x8
	.long	0x3b
	.long	0xfb
	.uleb128 0x9
	.long	0xfb
	.byte	0x2
	.byte	0
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.long	.LASF16
	.uleb128 0xa
	.long	.LASF47
	.byte	0x2
	.byte	0xff
	.byte	0x1
	.byte	0x3
	.long	0x13e
	.uleb128 0xb
	.long	.LASF48
	.byte	0x2
	.byte	0xff
	.long	0x13e
	.uleb128 0xc
	.long	.LASF17
	.byte	0x2
	.word	0x101
	.long	0x13e
	.uleb128 0xc
	.long	.LASF18
	.byte	0x2
	.word	0x105
	.long	0x78
	.uleb128 0xd
	.byte	0x1
	.long	.LASF49
	.byte	0x2
	.word	0x106
	.byte	0x1
	.byte	0
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x4
	.long	.LASF19
	.uleb128 0xe
	.byte	0x1
	.long	.LASF20
	.byte	0x1
	.byte	0x5
	.long	.LFB6
	.long	.LFE6
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x1cd
	.uleb128 0xf
	.long	0x102
	.long	.LBB22
	.long	.LBE22
	.byte	0x1
	.byte	0x8
	.long	0x197
	.uleb128 0x10
	.long	0x10f
	.long	.LLST0
	.uleb128 0x11
	.long	.LBB23
	.long	.LBE23
	.uleb128 0x12
	.long	0x11a
	.long	.LLST1
	.uleb128 0x12
	.long	0x126
	.long	.LLST2
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0x102
	.long	.LBB24
	.long	.LBE24
	.byte	0x1
	.byte	0xa
	.uleb128 0x10
	.long	0x10f
	.long	.LLST3
	.uleb128 0x11
	.long	.LBB25
	.long	.LBE25
	.uleb128 0x12
	.long	0x11a
	.long	.LLST4
	.uleb128 0x12
	.long	0x126
	.long	.LLST5
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0xe
	.byte	0x1
	.long	.LASF21
	.byte	0x1
	.byte	0xe
	.long	.LFB7
	.long	.LFE7
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x255
	.uleb128 0xf
	.long	0x102
	.long	.LBB26
	.long	.LBE26
	.byte	0x1
	.byte	0x11
	.long	0x21f
	.uleb128 0x10
	.long	0x10f
	.long	.LLST6
	.uleb128 0x11
	.long	.LBB27
	.long	.LBE27
	.uleb128 0x12
	.long	0x11a
	.long	.LLST7
	.uleb128 0x12
	.long	0x126
	.long	.LLST8
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0x102
	.long	.LBB28
	.long	.LBE28
	.byte	0x1
	.byte	0x13
	.uleb128 0x10
	.long	0x10f
	.long	.LLST9
	.uleb128 0x11
	.long	.LBB29
	.long	.LBE29
	.uleb128 0x12
	.long	0x11a
	.long	.LLST10
	.uleb128 0x12
	.long	0x126
	.long	.LLST11
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.byte	0x17
	.long	0x3b
	.long	.LFB8
	.long	.LFE8
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x329
	.uleb128 0x15
	.string	"ret"
	.byte	0x1
	.byte	0x19
	.long	0x3b
	.long	.LLST12
	.uleb128 0xf
	.long	0x102
	.long	.LBB30
	.long	.LBE30
	.byte	0x1
	.byte	0x1b
	.long	0x2ba
	.uleb128 0x10
	.long	0x10f
	.long	.LLST13
	.uleb128 0x11
	.long	.LBB31
	.long	.LBE31
	.uleb128 0x12
	.long	0x11a
	.long	.LLST14
	.uleb128 0x12
	.long	0x126
	.long	.LLST15
	.byte	0
	.byte	0
	.uleb128 0xf
	.long	0x102
	.long	.LBB32
	.long	.LBE32
	.byte	0x1
	.byte	0x1d
	.long	0x2f3
	.uleb128 0x10
	.long	0x10f
	.long	.LLST16
	.uleb128 0x11
	.long	.LBB33
	.long	.LBE33
	.uleb128 0x12
	.long	0x11a
	.long	.LLST17
	.uleb128 0x12
	.long	0x126
	.long	.LLST18
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0x102
	.long	.LBB34
	.long	.LBE34
	.byte	0x1
	.byte	0x1f
	.uleb128 0x10
	.long	0x10f
	.long	.LLST19
	.uleb128 0x11
	.long	.LBB35
	.long	.LBE35
	.uleb128 0x12
	.long	0x11a
	.long	.LLST20
	.uleb128 0x12
	.long	0x126
	.long	.LLST21
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x14
	.byte	0x1
	.long	.LASF23
	.byte	0x1
	.byte	0x24
	.long	0x3b
	.long	.LFB9
	.long	.LFE9
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x3fd
	.uleb128 0x15
	.string	"ret"
	.byte	0x1
	.byte	0x26
	.long	0x3b
	.long	.LLST22
	.uleb128 0xf
	.long	0x102
	.long	.LBB36
	.long	.LBE36
	.byte	0x1
	.byte	0x28
	.long	0x38e
	.uleb128 0x10
	.long	0x10f
	.long	.LLST23
	.uleb128 0x11
	.long	.LBB37
	.long	.LBE37
	.uleb128 0x12
	.long	0x11a
	.long	.LLST24
	.uleb128 0x12
	.long	0x126
	.long	.LLST25
	.byte	0
	.byte	0
	.uleb128 0xf
	.long	0x102
	.long	.LBB38
	.long	.LBE38
	.byte	0x1
	.byte	0x2a
	.long	0x3c7
	.uleb128 0x10
	.long	0x10f
	.long	.LLST26
	.uleb128 0x11
	.long	.LBB39
	.long	.LBE39
	.uleb128 0x12
	.long	0x11a
	.long	.LLST27
	.uleb128 0x12
	.long	0x126
	.long	.LLST28
	.byte	0
	.byte	0
	.uleb128 0x13
	.long	0x102
	.long	.LBB40
	.long	.LBE40
	.byte	0x1
	.byte	0x2c
	.uleb128 0x10
	.long	0x10f
	.long	.LLST29
	.uleb128 0x11
	.long	.LBB41
	.long	.LBE41
	.uleb128 0x12
	.long	0x11a
	.long	.LLST30
	.uleb128 0x12
	.long	0x126
	.long	.LLST31
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x16
	.byte	0x1
	.long	.LASF24
	.byte	0x1
	.byte	0x31
	.byte	0x1
	.long	.LFB10
	.long	.LFE10
	.long	.LLST32
	.byte	0x1
	.long	0x450
	.uleb128 0x17
	.long	.LASF26
	.byte	0x1
	.byte	0x31
	.long	0x3b
	.long	.LLST33
	.uleb128 0x11
	.long	.LBB42
	.long	.LBE42
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x32
	.long	0x3b
	.long	.LLST34
	.uleb128 0x18
	.long	.LVL26
	.long	0x1cd
	.uleb128 0x18
	.long	.LVL27
	.long	0x145
	.byte	0
	.byte	0
	.uleb128 0x19
	.byte	0x1
	.long	.LASF25
	.byte	0x1
	.byte	0x3c
	.long	0x3b
	.long	.LFB11
	.long	.LFE11
	.long	.LLST35
	.byte	0x1
	.long	0x49d
	.uleb128 0x1a
	.long	.LASF26
	.byte	0x1
	.byte	0x3d
	.long	0x3b
	.long	.LLST36
	.uleb128 0x11
	.long	.LBB43
	.long	.LBE43
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0x3e
	.long	0x3b
	.long	.LLST37
	.uleb128 0x18
	.long	.LVL35
	.long	0x329
	.byte	0
	.byte	0
	.uleb128 0x1b
	.byte	0x1
	.long	.LASF31
	.byte	0x1
	.byte	0x45
	.byte	0x1
	.long	0x3b
	.long	.LFB12
	.long	.LFE12
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x4f8
	.uleb128 0x17
	.long	.LASF27
	.byte	0x1
	.byte	0x45
	.long	0x3b
	.long	.LLST38
	.uleb128 0x17
	.long	.LASF28
	.byte	0x1
	.byte	0x45
	.long	0x5f
	.long	.LLST39
	.uleb128 0x1a
	.long	.LASF29
	.byte	0x1
	.byte	0x46
	.long	0x3b
	.long	.LLST40
	.uleb128 0x1a
	.long	.LASF30
	.byte	0x1
	.byte	0x47
	.long	0x3b
	.long	.LLST41
	.byte	0
	.uleb128 0x1c
	.byte	0x1
	.long	.LASF32
	.byte	0x1
	.byte	0x58
	.byte	0x1
	.long	0x29
	.long	.LFB13
	.long	.LFE13
	.long	.LLST42
	.byte	0x1
	.long	0x5c1
	.uleb128 0x17
	.long	.LASF33
	.byte	0x1
	.byte	0x58
	.long	0x5c1
	.long	.LLST43
	.uleb128 0x17
	.long	.LASF34
	.byte	0x1
	.byte	0x58
	.long	0x29
	.long	.LLST44
	.uleb128 0x1a
	.long	.LASF35
	.byte	0x1
	.byte	0x5a
	.long	0x46
	.long	.LLST45
	.uleb128 0x1a
	.long	.LASF36
	.byte	0x1
	.byte	0x5b
	.long	0x46
	.long	.LLST46
	.uleb128 0x1a
	.long	.LASF37
	.byte	0x1
	.byte	0x5c
	.long	0x46
	.long	.LLST47
	.uleb128 0x1a
	.long	.LASF38
	.byte	0x1
	.byte	0x5d
	.long	0x46
	.long	.LLST48
	.uleb128 0x1a
	.long	.LASF39
	.byte	0x1
	.byte	0x5e
	.long	0x46
	.long	.LLST49
	.uleb128 0x18
	.long	.LVL52
	.long	0x255
	.uleb128 0x1d
	.long	.LVL53
	.long	0x3fd
	.long	0x59c
	.uleb128 0x1e
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x9
	.byte	0xf0
	.byte	0
	.uleb128 0x18
	.long	.LVL55
	.long	0x329
	.uleb128 0x18
	.long	.LVL57
	.long	0x329
	.uleb128 0x18
	.long	.LVL69
	.long	0x1cd
	.uleb128 0x18
	.long	.LVL70
	.long	0x145
	.byte	0
	.uleb128 0x1f
	.byte	0x2
	.long	0x3b
	.uleb128 0x20
	.byte	0x1
	.long	.LASF40
	.byte	0x1
	.byte	0x99
	.byte	0x1
	.long	0x5f
	.long	.LFB14
	.long	.LFE14
	.long	.LLST50
	.byte	0x1
	.uleb128 0x21
	.long	.LASF41
	.byte	0x1
	.byte	0xa2
	.long	0x98
	.byte	0x2
	.byte	0x8c
	.sleb128 1
	.uleb128 0x21
	.long	.LASF42
	.byte	0x1
	.byte	0xa4
	.long	0x5c1
	.byte	0x3
	.byte	0x91
	.sleb128 -18
	.byte	0x9f
	.uleb128 0x15
	.string	"crc"
	.byte	0x1
	.byte	0xaa
	.long	0x58
	.long	.LLST51
	.uleb128 0x22
	.long	.LBB44
	.long	.LBE44
	.long	0x631
	.uleb128 0x15
	.string	"i"
	.byte	0x1
	.byte	0xa7
	.long	0x3b
	.long	.LLST52
	.uleb128 0x18
	.long	.LVL91
	.long	0x450
	.byte	0
	.uleb128 0x22
	.long	.LBB45
	.long	.LBE45
	.long	0x651
	.uleb128 0x23
	.string	"i"
	.byte	0x1
	.byte	0xac
	.long	0x3b
	.uleb128 0x18
	.long	.LVL93
	.long	0x49d
	.byte	0
	.uleb128 0x18
	.long	.LVL83
	.long	0x255
	.uleb128 0x1d
	.long	.LVL84
	.long	0x3fd
	.long	0x66e
	.uleb128 0x1e
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x9
	.byte	0xcc
	.byte	0
	.uleb128 0x1d
	.long	.LVL85
	.long	0x3fd
	.long	0x682
	.uleb128 0x1e
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x8
	.byte	0x44
	.byte	0
	.uleb128 0x18
	.long	.LVL86
	.long	0x329
	.uleb128 0x18
	.long	.LVL87
	.long	0x255
	.uleb128 0x1d
	.long	.LVL88
	.long	0x3fd
	.long	0x6a8
	.uleb128 0x1e
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x9
	.byte	0xcc
	.byte	0
	.uleb128 0x24
	.long	.LVL89
	.long	0x3fd
	.uleb128 0x1e
	.byte	0x1
	.byte	0x68
	.byte	0x2
	.byte	0x9
	.byte	0xbe
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x55
	.uleb128 0x6
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x52
	.uleb128 0x1
	.uleb128 0x10
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x20
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x5
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x34
	.byte	0
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x1d
	.byte	0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x58
	.uleb128 0xb
	.uleb128 0x59
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0xa
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0xc
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x40
	.uleb128 0x6
	.uleb128 0x2117
	.uleb128 0xc
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x22
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x23
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x24
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LVL0
	.long	.LVL1
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x42700000
	.long	0
	.long	0
.LLST1:
	.long	.LVL0
	.long	.LVL1
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x43f00000
	.long	0
	.long	0
.LLST2:
	.long	.LVL0
	.long	.LVL1
	.word	0x4
	.byte	0xa
	.word	0x1e0
	.byte	0x9f
	.long	0
	.long	0
.LLST3:
	.long	.LVL2
	.long	.LVL3
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x41200000
	.long	0
	.long	0
.LLST4:
	.long	.LVL2
	.long	.LVL3
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x42a00000
	.long	0
	.long	0
.LLST5:
	.long	.LVL2
	.long	.LVL3
	.word	0x3
	.byte	0x8
	.byte	0x50
	.byte	0x9f
	.long	0
	.long	0
.LLST6:
	.long	.LVL4
	.long	.LVL5
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x40c00000
	.long	0
	.long	0
.LLST7:
	.long	.LVL4
	.long	.LVL5
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x42400000
	.long	0
	.long	0
.LLST8:
	.long	.LVL4
	.long	.LVL5
	.word	0x3
	.byte	0x8
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST9:
	.long	.LVL6
	.long	.LVL7
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x42800000
	.long	0
	.long	0
.LLST10:
	.long	.LVL6
	.long	.LVL7
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x44000000
	.long	0
	.long	0
.LLST11:
	.long	.LVL6
	.long	.LVL7
	.word	0x4
	.byte	0xa
	.word	0x200
	.byte	0x9f
	.long	0
	.long	0
.LLST12:
	.long	.LVL8
	.long	.LVL13
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL13
	.long	.LFE8
	.word	0x5
	.byte	0x88
	.sleb128 0
	.byte	0x31
	.byte	0x1a
	.byte	0x9f
	.long	0
	.long	0
.LLST13:
	.long	.LVL9
	.long	.LVL10
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x43f00000
	.long	0
	.long	0
.LLST14:
	.long	.LVL9
	.long	.LVL10
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x45700000
	.long	0
	.long	0
.LLST15:
	.long	.LVL9
	.long	.LVL10
	.word	0x4
	.byte	0xa
	.word	0xf00
	.byte	0x9f
	.long	0
	.long	0
.LLST16:
	.long	.LVL11
	.long	.LVL12
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x428c0000
	.long	0
	.long	0
.LLST17:
	.long	.LVL11
	.long	.LVL12
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x440c0000
	.long	0
	.long	0
.LLST18:
	.long	.LVL11
	.long	.LVL12
	.word	0x4
	.byte	0xa
	.word	0x230
	.byte	0x9f
	.long	0
	.long	0
.LLST19:
	.long	.LVL13
	.long	.LVL14
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x43cd0000
	.long	0
	.long	0
.LLST20:
	.long	.LVL13
	.long	.LVL14
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x454d0000
	.long	0
	.long	0
.LLST21:
	.long	.LVL13
	.long	.LVL14
	.word	0x4
	.byte	0xa
	.word	0xcd0
	.byte	0x9f
	.long	0
	.long	0
.LLST22:
	.long	.LVL15
	.long	.LVL20
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL20
	.long	.LVL22
	.word	0x5
	.byte	0x88
	.sleb128 0
	.byte	0x31
	.byte	0x1a
	.byte	0x9f
	.long	.LVL22
	.long	.LFE9
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST23:
	.long	.LVL16
	.long	.LVL17
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x40c00000
	.long	0
	.long	0
.LLST24:
	.long	.LVL16
	.long	.LVL17
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x42400000
	.long	0
	.long	0
.LLST25:
	.long	.LVL16
	.long	.LVL17
	.word	0x3
	.byte	0x8
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
.LLST26:
	.long	.LVL18
	.long	.LVL19
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x41100000
	.long	0
	.long	0
.LLST27:
	.long	.LVL18
	.long	.LVL19
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x42900000
	.long	0
	.long	0
.LLST28:
	.long	.LVL18
	.long	.LVL19
	.word	0x3
	.byte	0x8
	.byte	0x48
	.byte	0x9f
	.long	0
	.long	0
.LLST29:
	.long	.LVL20
	.long	.LVL21
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x425c0000
	.long	0
	.long	0
.LLST30:
	.long	.LVL20
	.long	.LVL21
	.word	0x6
	.byte	0x9e
	.uleb128 0x4
	.long	0x43dc0000
	.long	0
	.long	0
.LLST31:
	.long	.LVL20
	.long	.LVL21
	.word	0x4
	.byte	0xa
	.word	0x1b8
	.byte	0x9f
	.long	0
	.long	0
.LLST32:
	.long	.LFB10
	.long	.LCFI0
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI0
	.long	.LCFI1
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI1
	.long	.LFE10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST33:
	.long	.LVL23
	.long	.LVL25
	.word	0x1
	.byte	0x68
	.long	.LVL25
	.long	.LVL30
	.word	0x1
	.byte	0x6d
	.long	0
	.long	0
.LLST34:
	.long	.LVL24
	.long	.LVL25
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL25
	.long	.LVL28
	.word	0x5
	.byte	0x38
	.byte	0x8c
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.long	.LVL28
	.long	.LVL29
	.word	0x5
	.byte	0x39
	.byte	0x8c
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.long	.LVL29
	.long	.LVL31
	.word	0x5
	.byte	0x38
	.byte	0x8c
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.long	0
	.long	0
.LLST35:
	.long	.LFB11
	.long	.LCFI2
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI2
	.long	.LCFI3
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI3
	.long	.LFE11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST36:
	.long	.LVL32
	.long	.LVL33
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL33
	.long	.LVL39
	.word	0x1
	.byte	0x6c
	.long	.LVL39
	.long	.LFE11
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST37:
	.long	.LVL32
	.long	.LVL33
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL33
	.long	.LVL36
	.word	0x5
	.byte	0x38
	.byte	0x8d
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.long	.LVL36
	.long	.LVL37
	.word	0x5
	.byte	0x39
	.byte	0x8d
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.long	.LVL37
	.long	.LVL38
	.word	0x5
	.byte	0x38
	.byte	0x8d
	.sleb128 0
	.byte	0x1c
	.byte	0x9f
	.long	0
	.long	0
.LLST38:
	.long	.LVL40
	.long	.LVL47
	.word	0x1
	.byte	0x68
	.long	.LVL47
	.long	.LVL49
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST39:
	.long	.LVL40
	.long	.LVL42
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL42
	.long	.LFE12
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST40:
	.long	.LVL40
	.long	.LVL41
	.word	0x2
	.byte	0x38
	.byte	0x9f
	.long	.LVL41
	.long	.LVL47
	.word	0x1
	.byte	0x69
	.long	.LVL47
	.long	.LVL48
	.word	0x3
	.byte	0x89
	.sleb128 -1
	.byte	0x9f
	.long	.LVL48
	.long	.LFE12
	.word	0x1
	.byte	0x69
	.long	0
	.long	0
.LLST41:
	.long	.LVL41
	.long	.LVL42
	.word	0x8
	.byte	0x88
	.sleb128 0
	.byte	0x86
	.sleb128 0
	.byte	0x27
	.byte	0x31
	.byte	0x1a
	.byte	0x9f
	.long	.LVL43
	.long	.LVL44
	.word	0x8
	.byte	0x88
	.sleb128 0
	.byte	0x86
	.sleb128 0
	.byte	0x27
	.byte	0x31
	.byte	0x1a
	.byte	0x9f
	.long	.LVL44
	.long	.LVL45
	.word	0xa
	.byte	0x86
	.sleb128 0
	.byte	0x48
	.byte	0x27
	.byte	0x88
	.sleb128 0
	.byte	0x27
	.byte	0x31
	.byte	0x1a
	.byte	0x9f
	.long	0
	.long	0
.LLST42:
	.long	.LFB13
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI4
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI5
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI6
	.long	.LCFI7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI7
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI8
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI9
	.long	.LCFI10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	.LCFI10
	.long	.LCFI11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	.LCFI11
	.long	.LCFI12
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 10
	.long	.LCFI12
	.long	.LFE13
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 11
	.long	0
	.long	0
.LLST43:
	.long	.LVL50
	.long	.LVL52-1
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL52-1
	.long	.LVL80
	.word	0x6
	.byte	0x60
	.byte	0x93
	.uleb128 0x1
	.byte	0x61
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST44:
	.long	.LVL50
	.long	.LVL52-1
	.word	0x1
	.byte	0x66
	.long	.LVL52-1
	.long	.LVL81
	.word	0x1
	.byte	0x5c
	.long	.LVL81
	.long	.LFE13
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x66
	.byte	0x9f
	.long	0
	.long	0
.LLST45:
	.long	.LVL51
	.long	.LVL54
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL54
	.long	.LVL70
	.word	0x1
	.byte	0x5e
	.long	.LVL70
	.long	.LVL75
	.word	0x3
	.byte	0x7e
	.sleb128 1
	.byte	0x9f
	.long	.LVL75
	.long	.LVL77
	.word	0x1
	.byte	0x5e
	.long	0
	.long	0
.LLST46:
	.long	.LVL51
	.long	.LVL54
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	.LVL54
	.long	.LVL65
	.word	0x1
	.byte	0x6d
	.long	.LVL66
	.long	.LVL67
	.word	0x1
	.byte	0x6d
	.long	.LVL68
	.long	.LVL78
	.word	0x1
	.byte	0x6d
	.long	0
	.long	0
.LLST47:
	.long	.LVL51
	.long	.LVL54
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL54
	.long	.LVL72
	.word	0x1
	.byte	0x6c
	.long	.LVL72
	.long	.LVL74
	.word	0x2
	.byte	0x31
	.byte	0x9f
	.long	.LVL74
	.long	.LVL79
	.word	0x1
	.byte	0x6c
	.long	0
	.long	0
.LLST48:
	.long	.LVL56
	.long	.LVL82
	.word	0x1
	.byte	0x5b
	.long	0
	.long	0
.LLST49:
	.long	.LVL57
	.long	.LVL58
	.word	0x1
	.byte	0x68
	.long	.LVL59
	.long	.LVL60
	.word	0x1
	.byte	0x68
	.long	.LVL61
	.long	.LVL62
	.word	0x1
	.byte	0x68
	.long	.LVL63
	.long	.LVL64
	.word	0x1
	.byte	0x68
	.long	.LVL66
	.long	.LVL67
	.word	0x1
	.byte	0x68
	.long	.LVL76
	.long	.LVL77
	.word	0x1
	.byte	0x68
	.long	0
	.long	0
.LLST50:
	.long	.LFB14
	.long	.LCFI13
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.long	.LCFI13
	.long	.LCFI14
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 3
	.long	.LCFI14
	.long	.LCFI15
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI15
	.long	.LCFI16
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI16
	.long	.LCFI17
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI17
	.long	.LCFI18
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI18
	.long	.LCFI19
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	.LCFI19
	.long	.LCFI20
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	.LCFI20
	.long	.LCFI21
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 10
	.long	.LCFI21
	.long	.LCFI22
	.word	0x2
	.byte	0x8c
	.sleb128 10
	.long	.LCFI22
	.long	.LFE14
	.word	0x2
	.byte	0x8c
	.sleb128 19
	.long	0
	.long	0
.LLST51:
	.long	.LVL92
	.long	.LVL93-1
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL94
	.long	.LVL95
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	.LVL96
	.long	.LVL97
	.word	0x6
	.byte	0x66
	.byte	0x93
	.uleb128 0x1
	.byte	0x67
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST52:
	.long	.LVL89
	.long	.LVL90
	.word	0x2
	.byte	0x30
	.byte	0x9f
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x5c
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB6
	.long	.LFE6-.LFB6
	.long	.LFB7
	.long	.LFE7-.LFB7
	.long	.LFB8
	.long	.LFE8-.LFB8
	.long	.LFB9
	.long	.LFE9-.LFB9
	.long	.LFB10
	.long	.LFE10-.LFB10
	.long	.LFB11
	.long	.LFE11-.LFB11
	.long	.LFB12
	.long	.LFE12-.LFB12
	.long	.LFB13
	.long	.LFE13-.LFB13
	.long	.LFB14
	.long	.LFE14-.LFB14
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB6
	.long	.LFE6
	.long	.LFB7
	.long	.LFE7
	.long	.LFB8
	.long	.LFE8
	.long	.LFB9
	.long	.LFE9
	.long	.LFB10
	.long	.LFE10
	.long	.LFB11
	.long	.LFE11
	.long	.LFB12
	.long	.LFE12
	.long	.LFB13
	.long	.LFE13
	.long	.LFB14
	.long	.LFE14
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF47:
	.string	"_delay_us"
.LASF21:
	.string	"oneWireSendOne"
.LASF43:
	.string	"GNU C99 5.4.0 -mn-flash=1 -mno-skip-bug -mmcu=avr25 -msp8 -g2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -ffunction-sections -fdata-sections -fpack-struct -fshort-enums"
.LASF15:
	.string	"reserved"
.LASF27:
	.string	"inData"
.LASF26:
	.string	"data"
.LASF48:
	.string	"__us"
.LASF42:
	.string	"byte"
.LASF34:
	.string	"lastDeviation"
.LASF49:
	.string	"__builtin_avr_delay_cycles"
.LASF0:
	.string	"int8_t"
.LASF31:
	.string	"oneWireComputeCRC8"
.LASF12:
	.string	"temperature"
.LASF24:
	.string	"oneWireSendByte"
.LASF3:
	.string	"unsigned char"
.LASF33:
	.string	"bitPattern"
.LASF35:
	.string	"currentBit"
.LASF9:
	.string	"long unsigned int"
.LASF30:
	.string	"temp"
.LASF38:
	.string	"bitA"
.LASF39:
	.string	"bitB"
.LASF36:
	.string	"newDeviation"
.LASF13:
	.string	"temperatureAlarm"
.LASF14:
	.string	"config"
.LASF19:
	.string	"double"
.LASF20:
	.string	"oneWireSendZero"
.LASF17:
	.string	"__tmp"
.LASF37:
	.string	"bitMask"
.LASF6:
	.string	"unsigned int"
.LASF41:
	.string	"scratchpad"
.LASF46:
	.string	"scratchpad_struct"
.LASF11:
	.string	"long long unsigned int"
.LASF1:
	.string	"uint8_t"
.LASF45:
	.string	"C:\\\\Users\\\\programowanie\\\\Documents\\\\Atmel Studio\\\\7.0\\\\attiny2313\\\\test0\\\\Debug"
.LASF4:
	.string	"int16_t"
.LASF25:
	.string	"oneWireReceiveByte"
.LASF44:
	.string	".././1wire.c"
.LASF23:
	.string	"oneWireReceiveBit"
.LASF16:
	.string	"sizetype"
.LASF10:
	.string	"long long int"
.LASF40:
	.string	"ds18b20ReadTemp"
.LASF18:
	.string	"__ticks_dc"
.LASF32:
	.string	"oneWireSearchRom"
.LASF5:
	.string	"uint16_t"
.LASF28:
	.string	"seed"
.LASF29:
	.string	"bitsLeft"
.LASF22:
	.string	"oneWireReset"
.LASF8:
	.string	"uint32_t"
.LASF7:
	.string	"long int"
.LASF2:
	.string	"signed char"
	.ident	"GCC: (AVR_8_bit_GNU_Toolchain_3.6.1_1750) 5.4.0"
