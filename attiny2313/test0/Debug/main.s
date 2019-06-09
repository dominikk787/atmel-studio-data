	.file	"main.c"
__SP_L__ = 0x3d
__SREG__ = 0x3f
__tmp_reg__ = 0
__zero_reg__ = 1
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.section	.text.dispnum,"ax",@progbits
.global	dispnum
	.type	dispnum, @function
dispnum:
.LFB7:
	.file 1 ".././main.c"
	.loc 1 101 0
	.cfi_startproc
.LVL0:
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
	movw r18,r24
.LVL1:
	.loc 1 106 0
	ldi r28,lo8(leddata)
	ldi r29,hi8(leddata)
	ldi r22,lo8(100)
	ldi r23,0
	rcall __udivmodhi4
.LVL2:
	movw r30,r22
	clr r31
	subi r30,lo8(-(lednumbers))
	sbci r31,hi8(-(lednumbers))
	ld r24,Z
	st Y,r24
	.loc 1 107 0
	ldi r30,lo8(10)
	ldi r31,0
	movw r24,r18
	movw r22,r30
	rcall __udivmodhi4
	movw r18,r24
.LVL3:
	movw r24,r22
	movw r22,r30
	rcall __udivmodhi4
	movw r30,r24
	subi r30,lo8(-(lednumbers))
	sbci r31,hi8(-(lednumbers))
	ld r24,Z
	std Y+1,r24
	.loc 1 108 0
	movw r30,r18
	subi r30,lo8(-(lednumbers))
	sbci r31,hi8(-(lednumbers))
	ld r24,Z
	std Y+2,r24
/* epilogue start */
	.loc 1 109 0
	pop r29
	pop r28
	ret
	.cfi_endproc
.LFE7:
	.size	dispnum, .-dispnum
	.section	.text.startup.main,"ax",@progbits
.global	main
	.type	main, @function
main:
.LFB6:
	.loc 1 43 0
	.cfi_startproc
/* prologue: function */
/* frame size = 0 */
/* stack size = 0 */
.L__stack_usage = 0
	.loc 1 44 0
/* #APP */
 ;  44 ".././main.c" 1
	cli
 ;  0 "" 2
	.loc 1 45 0
 ;  45 ".././main.c" 1
	wdr
 ;  0 "" 2
	.loc 1 46 0
/* #NOAPP */
	in r24,0x34
	andi r24,lo8(-9)
	out 0x34,r24
	.loc 1 47 0
	in r24,0x21
	ori r24,lo8(24)
	out 0x21,r24
	.loc 1 48 0
	out 0x21,__zero_reg__
	.loc 1 49 0
	sbi 0x18,1
	.loc 1 50 0
	sbic 0x16,1
	rjmp .L3
	.loc 1 51 0
/* #APP */
 ;  51 ".././main.c" 1
	ldi r30, 0x6F
 ;  0 "" 2
	.loc 1 52 0
 ;  52 ".././main.c" 1
	ldi r31, 3
 ;  0 "" 2
	.loc 1 53 0
 ;  53 ".././main.c" 1
	ijmp
 ;  0 "" 2
/* #NOAPP */
.L3:
	.loc 1 55 0
	out 0x18,__zero_reg__
	.loc 1 56 0
	ldi r24,lo8(-3)
	out 0x17,r24
	.loc 1 57 0
	sbi 0x1a,1
	.loc 1 58 0
	in r24,0x11
	ori r24,lo8(28)
	out 0x11,r24
	.loc 1 59 0
	out 0x12,__zero_reg__
	.loc 1 60 0
	in r24,0x2f
	ori r24,lo8(1)
	out 0x2f,r24
	.loc 1 61 0
	in r24,0x2e
	ori r24,lo8(-54)
	out 0x2e,r24
	.loc 1 62 0
	in r24,0x39
	ori r24,lo8(-120)
	out 0x39,r24
	.loc 1 63 0
	in r24,0x30
	ori r24,lo8(18)
	out 0x30,r24
	.loc 1 64 0
	in r24,0x33
	ori r24,lo8(4)
	out 0x33,r24
	.loc 1 65 0
/* #APP */
 ;  65 ".././main.c" 1
	sei
 ;  0 "" 2
/* #NOAPP */
.LBB2:
	.loc 1 71 0
	ldi r24,lo8(-24)
	mov r12,r24
	ldi r24,lo8(3)
	mov r13,r24
	.loc 1 79 0
	ldi r17,lo8(1)
	.loc 1 96 0
	clr r14
	dec r14
	mov r15,r14
	.loc 1 93 0
	ldi r16,lo8(3)
	.loc 1 87 0
	ldi r18,lo8(18)
	mov r11,r18
.L4:
	.loc 1 69 0
	rcall ds18b20ReadTemp
.LVL4:
	movw r28,r24
.LVL5:
	.loc 1 71 0
	movw r22,r12
	rcall __udivmodhi4
.LVL6:
	rcall dispnum
.LVL7:
	.loc 1 72 0
	cpi r28,-48
	ldi r18,7
	cpc r29,r18
	brne .L5
	.loc 1 73 0
	sts beepe,r17
	.loc 1 74 0
	lds r24,beepc
	lds r25,beepc+1
	adiw r24,1
	brne .L6
.L23:
	.loc 1 74 0 is_stmt 0 discriminator 1
	sts beepc+1,__zero_reg__
	sts beepc,__zero_reg__
.L6:
	.loc 1 75 0 is_stmt 1
	sbi 0x11,5
	.loc 1 76 0
	out 0x36,r16
	.loc 1 77 0
	rjmp .L4
.L5:
	.loc 1 79 0
	lds r18,oldtemp.1757
	lds r19,oldtemp.1757+1
	ldi r25,lo8(1)
	cpi r18,-5
	cpc r19,__zero_reg__
	brsh .L10
	ldi r25,0
.L10:
	ldi r24,lo8(1)
	cpi r28,-5
	cpc r29,__zero_reg__
	brsh .L11
	ldi r24,0
.L11:
	cpse r25,r24
	rjmp .L16
	ldi r25,lo8(1)
	cpi r18,-6
	cpc r19,__zero_reg__
	brlo .L12
	ldi r25,0
.L12:
	ldi r24,lo8(1)
	cpi r28,-6
	cpc r29,__zero_reg__
	brlo .L13
	ldi r24,0
.L13:
	cpse r25,r24
.L16:
	.loc 1 80 0
	sts beepe,r17
.L8:
	.loc 1 82 0
	sts oldtemp.1757+1,r29
	sts oldtemp.1757,r28
	.loc 1 83 0
	cpi r28,-55
	cpc r29,__zero_reg__
	brsh .L14
	.loc 1 84 0
	lds r24,beepe
	tst r24
	brne .+2
	rjmp .L4
	.loc 1 85 0
	sts beepc+1,__zero_reg__
	sts beepc,__zero_reg__
	.loc 1 86 0
	sbi 0x11,5
	.loc 1 87 0
	out 0x36,r11
	rjmp .L4
.L14:
	.loc 1 89 0
	cpi r28,44
	sbci r29,1
	brlo .L15
	.loc 1 90 0
	lds r24,beepe
	tst r24
	brne .+2
	rjmp .L4
	rjmp .L23
.L15:
	.loc 1 96 0
	sts beepc+1,r15
	sts beepc,r14
	rjmp .L4
.LBE2:
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.text.__vector_5,"ax",@progbits
.global	__vector_5
	.type	__vector_5, @function
__vector_5:
.LFB8:
	.loc 1 111 0
	.cfi_startproc
	push r1
.LCFI2:
	.cfi_def_cfa_offset 3
	.cfi_offset 1, -2
	push r0
.LCFI3:
	.cfi_def_cfa_offset 4
	.cfi_offset 0, -3
	in r0,__SREG__
	push r0
	clr __zero_reg__
	push r18
.LCFI4:
	.cfi_def_cfa_offset 5
	.cfi_offset 18, -4
	push r19
.LCFI5:
	.cfi_def_cfa_offset 6
	.cfi_offset 19, -5
	push r20
.LCFI6:
	.cfi_def_cfa_offset 7
	.cfi_offset 20, -6
	push r22
.LCFI7:
	.cfi_def_cfa_offset 8
	.cfi_offset 22, -7
	push r23
.LCFI8:
	.cfi_def_cfa_offset 9
	.cfi_offset 23, -8
	push r24
.LCFI9:
	.cfi_def_cfa_offset 10
	.cfi_offset 24, -9
	push r25
.LCFI10:
	.cfi_def_cfa_offset 11
	.cfi_offset 25, -10
	push r30
.LCFI11:
	.cfi_def_cfa_offset 12
	.cfi_offset 30, -11
	push r31
.LCFI12:
	.cfi_def_cfa_offset 13
	.cfi_offset 31, -12
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 12 */
.L__stack_usage = 12
	.loc 1 113 0
	in r24,0x12
	andi r24,lo8(99)
	out 0x12,r24
	.loc 1 114 0
	lds r30,dnumber.1769
	ldi r31,0
	subi r30,lo8(-(leddata))
	sbci r31,hi8(-(leddata))
	ld r24,Z
	com r24
	out 0x18,r24
	.loc 1 115 0
	in r24,0x1b
	andi r24,lo8(5)
	out 0x1b,r24
	.loc 1 116 0
	in r24,0x1b
	lds r25,dnumber.1769
	cpi r25,lo8(1)
	brne .L31
	ldi r25,0
	rjmp .L26
.L31:
	ldi r25,lo8(2)
.L26:
	.loc 1 116 0 is_stmt 0 discriminator 4
	or r24,r25
	out 0x1b,r24
	.loc 1 117 0 is_stmt 1 discriminator 4
	in r20,0x12
	lds r24,dnumber.1769
	ldi r18,lo8(4)
	ldi r19,0
	sub r18,r24
	sbc r19,__zero_reg__
	ldi r24,lo8(1)
	ldi r25,0
	rjmp 2f
	1:
	lsl r24
	2:
	dec r18
	brpl 1b
	or r24,r20
	out 0x12,r24
	.loc 1 119 0 discriminator 4
	lds r24,dnumber.1769
	subi r24,lo8(-(1))
	ldi r22,lo8(3)
	rcall __udivmodqi4
	sts dnumber.1769,r25
	.loc 1 121 0 discriminator 4
	lds r24,beepe
	tst r24
	breq .L27
	.loc 1 122 0
	lds r24,beepc
	lds r25,beepc+1
	cpi r24,32
	sbci r25,3
	brne .L28
	.loc 1 123 0
	in r25,0x11
	ldi r24,lo8(32)
	eor r24,r25
	out 0x11,r24
	.loc 1 124 0
	sts beepc+1,__zero_reg__
	sts beepc,__zero_reg__
	rjmp .L29
.L28:
	.loc 1 125 0
	lds r24,beepc
	lds r25,beepc+1
	adiw r24,1
	brne .L29
	.loc 1 125 0 discriminator 1
	cbi 0x11,5
.L29:
	.loc 1 126 0
	lds r24,beepc
	lds r25,beepc+1
	adiw r24,1
	breq .L25
	.loc 1 126 0 is_stmt 0 discriminator 1
	lds r24,beepc
	lds r25,beepc+1
	adiw r24,1
	rjmp .L35
.L27:
	.loc 1 128 0 is_stmt 1
	cbi 0x11,5
	.loc 1 129 0
	ldi r24,lo8(-1)
	ldi r25,lo8(-1)
.L35:
	sts beepc+1,r25
	sts beepc,r24
.L25:
/* epilogue start */
	.loc 1 131 0
	pop r31
	pop r30
	pop r25
	pop r24
	pop r23
	pop r22
	pop r20
	pop r19
	pop r18
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.cfi_endproc
.LFE8:
	.size	__vector_5, .-__vector_5
	.section	.text.__vector_3,"ax",@progbits
.global	__vector_3
	.type	__vector_3, @function
__vector_3:
.LFB9:
	.loc 1 133 0
	.cfi_startproc
	push r1
.LCFI13:
	.cfi_def_cfa_offset 3
	.cfi_offset 1, -2
	push r0
.LCFI14:
	.cfi_def_cfa_offset 4
	.cfi_offset 0, -3
	in r0,__SREG__
	push r0
	clr __zero_reg__
/* prologue: Signal */
/* frame size = 0 */
/* stack size = 3 */
.L__stack_usage = 3
	.loc 1 134 0
	sts beepe,__zero_reg__
/* epilogue start */
	.loc 1 135 0
	pop r0
	out __SREG__,r0
	pop r0
	pop r1
	reti
	.cfi_endproc
.LFE9:
	.size	__vector_3, .-__vector_3
	.section	.bss.dnumber.1769,"aw",@nobits
	.type	dnumber.1769, @object
	.size	dnumber.1769, 1
dnumber.1769:
	.zero	1
	.section	.bss.oldtemp.1757,"aw",@nobits
	.type	oldtemp.1757, @object
	.size	oldtemp.1757, 2
oldtemp.1757:
	.zero	2
.global	lednumbers
	.section	.data.lednumbers,"aw",@progbits
	.type	lednumbers, @object
	.size	lednumbers, 10
lednumbers:
	.byte	127
	.byte	14
	.byte	-73
	.byte	-97
	.byte	-50
	.byte	-37
	.byte	-5
	.byte	15
	.byte	-1
	.byte	-33
	.comm	leddata,3,1
.global	beepe
	.section	.bss.beepe,"aw",@nobits
	.type	beepe, @object
	.size	beepe, 1
beepe:
	.zero	1
.global	beepc
	.section	.data.beepc,"aw",@progbits
	.type	beepc, @object
	.size	beepc, 2
beepc:
	.word	-1
	.text
.Letext0:
	.file 2 "c:\\program files (x86)\\atmel\\studio\\7.0\\toolchain\\avr8\\avr8-gnu-toolchain\\avr\\include\\stdint.h"
	.file 3 ".././1wire.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x1de
	.word	0x2
	.long	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.long	.LASF19
	.byte	0xc
	.long	.LASF20
	.long	.LASF21
	.long	.Ldebug_ranges0+0
	.long	0
	.long	0
	.long	.Ldebug_line0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.long	.LASF1
	.uleb128 0x3
	.long	.LASF3
	.byte	0x2
	.byte	0x7e
	.long	0x42
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.long	.LASF2
	.uleb128 0x4
	.byte	0x2
	.byte	0x5
	.string	"int"
	.uleb128 0x3
	.long	.LASF4
	.byte	0x2
	.byte	0x80
	.long	0x29
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.long	.LASF5
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.long	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.long	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.long	.LASF8
	.uleb128 0x5
	.long	0x37
	.long	0x87
	.uleb128 0x6
	.long	0x87
	.byte	0x2
	.byte	0
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.long	.LASF9
	.uleb128 0x7
	.byte	0x1
	.long	.LASF12
	.byte	0x1
	.byte	0x65
	.byte	0x1
	.long	.LFB7
	.long	.LFE7
	.long	.LLST0
	.byte	0x1
	.long	0xc5
	.uleb128 0x8
	.string	"val"
	.byte	0x1
	.byte	0x65
	.long	0x50
	.long	.LLST1
	.uleb128 0x9
	.string	"d"
	.byte	0x1
	.byte	0x66
	.long	0x77
	.long	.LLST2
	.byte	0
	.uleb128 0xa
	.byte	0x1
	.long	.LASF22
	.byte	0x1
	.byte	0x2a
	.byte	0x1
	.long	0x49
	.byte	0x1
	.long	.LFB6
	.long	.LFE6
	.byte	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 2
	.byte	0x1
	.long	0x130
	.uleb128 0xb
	.long	.LBB2
	.long	.LBE2
	.uleb128 0xc
	.long	.LASF10
	.byte	0x1
	.byte	0x45
	.long	0x50
	.long	.LLST3
	.uleb128 0xd
	.long	.LASF11
	.byte	0x1
	.byte	0x46
	.long	0x50
	.byte	0x5
	.byte	0x3
	.long	oldtemp.1757
	.uleb128 0xe
	.long	.LVL4
	.long	0x1d4
	.uleb128 0xf
	.long	.LVL7
	.long	0x8e
	.uleb128 0x10
	.byte	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.byte	0x5
	.byte	0x8c
	.sleb128 0
	.byte	0x7c
	.sleb128 0
	.byte	0x1d
	.byte	0
	.byte	0
	.byte	0
	.uleb128 0x7
	.byte	0x1
	.long	.LASF13
	.byte	0x1
	.byte	0x6f
	.byte	0x1
	.long	.LFB8
	.long	.LFE8
	.long	.LLST4
	.byte	0x1
	.long	0x15c
	.uleb128 0xd
	.long	.LASF14
	.byte	0x1
	.byte	0x70
	.long	0x37
	.byte	0x5
	.byte	0x3
	.long	dnumber.1769
	.byte	0
	.uleb128 0x11
	.byte	0x1
	.long	.LASF23
	.byte	0x1
	.byte	0x85
	.byte	0x1
	.long	.LFB9
	.long	.LFE9
	.long	.LLST5
	.byte	0x1
	.uleb128 0x12
	.long	.LASF15
	.byte	0x1
	.byte	0x16
	.long	0x184
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	beepc
	.uleb128 0x13
	.long	0x50
	.uleb128 0x12
	.long	.LASF16
	.byte	0x1
	.byte	0x17
	.long	0x19b
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	beepe
	.uleb128 0x13
	.long	0x37
	.uleb128 0x12
	.long	.LASF17
	.byte	0x1
	.byte	0x19
	.long	0x77
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	leddata
	.uleb128 0x5
	.long	0x37
	.long	0x1c2
	.uleb128 0x6
	.long	0x87
	.byte	0x9
	.byte	0
	.uleb128 0x12
	.long	.LASF18
	.byte	0x1
	.byte	0x1b
	.long	0x1b2
	.byte	0x1
	.byte	0x5
	.byte	0x3
	.long	lednumbers
	.uleb128 0x14
	.byte	0x1
	.byte	0x1
	.long	.LASF24
	.long	.LASF24
	.byte	0x3
	.byte	0x1f
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
	.uleb128 0x3
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
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x8
	.uleb128 0x5
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
	.uleb128 0x9
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
	.uleb128 0xa
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
	.uleb128 0x87
	.uleb128 0xc
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
	.uleb128 0xb
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x1
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
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
	.uleb128 0x4109
	.byte	0
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x4109
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x31
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x410a
	.byte	0
	.uleb128 0x2
	.uleb128 0xa
	.uleb128 0x2111
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x12
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
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x2
	.uleb128 0xa
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0xc
	.uleb128 0x3c
	.uleb128 0xc
	.uleb128 0x2007
	.uleb128 0xe
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_loc,"",@progbits
.Ldebug_loc0:
.LLST0:
	.long	.LFB7
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
	.long	.LFE7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
.LLST1:
	.long	.LVL0
	.long	.LVL2
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL2
	.long	.LVL3
	.word	0x6
	.byte	0x62
	.byte	0x93
	.uleb128 0x1
	.byte	0x63
	.byte	0x93
	.uleb128 0x1
	.long	.LVL3
	.long	.LFE7
	.word	0x4
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x9f
	.long	0
	.long	0
.LLST2:
	.long	.LVL1
	.long	.LVL2
	.word	0x24
	.byte	0x88
	.sleb128 0
	.byte	0xf7
	.uleb128 0x29
	.byte	0x8
	.byte	0x64
	.byte	0xf7
	.uleb128 0x29
	.byte	0x1b
	.byte	0xf7
	.uleb128 0
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0x88
	.sleb128 0
	.byte	0xf7
	.uleb128 0x29
	.byte	0x3a
	.byte	0xf7
	.uleb128 0x29
	.byte	0x1b
	.byte	0xf7
	.uleb128 0
	.byte	0x3a
	.byte	0x1d
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0x88
	.sleb128 0
	.byte	0x3a
	.byte	0x1d
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL2
	.long	.LVL3
	.word	0x24
	.byte	0x82
	.sleb128 0
	.byte	0xf7
	.uleb128 0x29
	.byte	0x8
	.byte	0x64
	.byte	0xf7
	.uleb128 0x29
	.byte	0x1b
	.byte	0xf7
	.uleb128 0
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0x82
	.sleb128 0
	.byte	0xf7
	.uleb128 0x29
	.byte	0x3a
	.byte	0xf7
	.uleb128 0x29
	.byte	0x1b
	.byte	0xf7
	.uleb128 0
	.byte	0x3a
	.byte	0x1d
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0x82
	.sleb128 0
	.byte	0x3a
	.byte	0x1d
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.long	.LVL3
	.long	.LFE7
	.word	0x27
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0xf7
	.uleb128 0x29
	.byte	0x8
	.byte	0x64
	.byte	0xf7
	.uleb128 0x29
	.byte	0x1b
	.byte	0xf7
	.uleb128 0
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0xf7
	.uleb128 0x29
	.byte	0x3a
	.byte	0xf7
	.uleb128 0x29
	.byte	0x1b
	.byte	0xf7
	.uleb128 0
	.byte	0x3a
	.byte	0x1d
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.byte	0xf3
	.uleb128 0x1
	.byte	0x68
	.byte	0x3a
	.byte	0x1d
	.byte	0x9f
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST3:
	.long	.LVL5
	.long	.LVL6
	.word	0x6
	.byte	0x68
	.byte	0x93
	.uleb128 0x1
	.byte	0x69
	.byte	0x93
	.uleb128 0x1
	.long	.LVL6
	.long	.LFE6
	.word	0x6
	.byte	0x6c
	.byte	0x93
	.uleb128 0x1
	.byte	0x6d
	.byte	0x93
	.uleb128 0x1
	.long	0
	.long	0
.LLST4:
	.long	.LFB8
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
	.long	.LCFI4
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	.LCFI4
	.long	.LCFI5
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 5
	.long	.LCFI5
	.long	.LCFI6
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 6
	.long	.LCFI6
	.long	.LCFI7
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 7
	.long	.LCFI7
	.long	.LCFI8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 8
	.long	.LCFI8
	.long	.LCFI9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 9
	.long	.LCFI9
	.long	.LCFI10
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 10
	.long	.LCFI10
	.long	.LCFI11
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 11
	.long	.LCFI11
	.long	.LCFI12
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 12
	.long	.LCFI12
	.long	.LFE8
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 13
	.long	0
	.long	0
.LLST5:
	.long	.LFB9
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
	.long	.LFE9
	.word	0x3
	.byte	0x92
	.uleb128 0x20
	.sleb128 4
	.long	0
	.long	0
	.section	.debug_aranges,"",@progbits
	.long	0x34
	.word	0x2
	.long	.Ldebug_info0
	.byte	0x4
	.byte	0
	.word	0
	.word	0
	.long	.LFB7
	.long	.LFE7-.LFB7
	.long	.LFB6
	.long	.LFE6-.LFB6
	.long	.LFB8
	.long	.LFE8-.LFB8
	.long	.LFB9
	.long	.LFE9-.LFB9
	.long	0
	.long	0
	.section	.debug_ranges,"",@progbits
.Ldebug_ranges0:
	.long	.LFB7
	.long	.LFE7
	.long	.LFB6
	.long	.LFE6
	.long	.LFB8
	.long	.LFE8
	.long	.LFB9
	.long	.LFE9
	.long	0
	.long	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF20:
	.string	".././main.c"
.LASF19:
	.string	"GNU C99 5.4.0 -mn-flash=1 -mno-skip-bug -mmcu=avr25 -msp8 -g2 -Os -std=gnu99 -funsigned-char -funsigned-bitfields -ffunction-sections -fdata-sections -fpack-struct -fshort-enums"
.LASF18:
	.string	"lednumbers"
.LASF15:
	.string	"beepc"
.LASF16:
	.string	"beepe"
.LASF2:
	.string	"unsigned char"
.LASF6:
	.string	"long unsigned int"
.LASF10:
	.string	"temp"
.LASF11:
	.string	"oldtemp"
.LASF22:
	.string	"main"
.LASF0:
	.string	"unsigned int"
.LASF8:
	.string	"long long unsigned int"
.LASF3:
	.string	"uint8_t"
.LASF21:
	.string	"C:\\\\Users\\\\programowanie\\\\Documents\\\\Atmel Studio\\\\7.0\\\\attiny2313\\\\test0\\\\Debug"
.LASF9:
	.string	"sizetype"
.LASF7:
	.string	"long long int"
.LASF24:
	.string	"ds18b20ReadTemp"
.LASF12:
	.string	"dispnum"
.LASF4:
	.string	"uint16_t"
.LASF23:
	.string	"__vector_3"
.LASF13:
	.string	"__vector_5"
.LASF5:
	.string	"long int"
.LASF17:
	.string	"leddata"
.LASF1:
	.string	"signed char"
.LASF14:
	.string	"dnumber"
	.ident	"GCC: (AVR_8_bit_GNU_Toolchain_3.6.1_1750) 5.4.0"
.global __do_copy_data
.global __do_clear_bss
