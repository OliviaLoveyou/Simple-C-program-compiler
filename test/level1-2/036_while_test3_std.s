	.arch armv7-a
	.eabi_attribute 28, 1
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 6
	.eabi_attribute 34, 1
	.eabi_attribute 18, 4
	.file	"036_while_test3.sy"
	.text
	.comm	g,4,4
	.comm	h,4,4
	.comm	f,4,4
	.comm	e,4,4
	.align	1
	.global	EightWhile
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	EightWhile, %function
EightWhile:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	ldr	r3, .L19
.LPIC0:
	add	r3, pc
	movs	r2, #5
	str	r2, [r7]
	movs	r2, #6
	str	r2, [r7, #4]
	movs	r2, #7
	str	r2, [r7, #8]
	movs	r2, #10
	str	r2, [r7, #12]
	b	.L2
.L17:
	ldr	r2, [r7]
	adds	r2, r2, #3
	str	r2, [r7]
	b	.L3
.L16:
	ldr	r2, [r7, #4]
	adds	r2, r2, #1
	str	r2, [r7, #4]
	b	.L4
.L15:
	ldr	r2, [r7, #8]
	subs	r2, r2, #1
	str	r2, [r7, #8]
	b	.L5
.L14:
	ldr	r2, [r7, #12]
	adds	r2, r2, #3
	str	r2, [r7, #12]
	b	.L6
.L13:
	ldr	r2, .L19+4
	ldr	r2, [r3, r2]
	ldr	r2, [r2]
	subs	r2, r2, #1
	ldr	r1, .L19+4
	ldr	r1, [r3, r1]
	str	r2, [r1]
	b	.L7
.L12:
	ldr	r2, .L19+8
	ldr	r2, [r3, r2]
	ldr	r2, [r2]
	subs	r2, r2, #2
	ldr	r1, .L19+8
	ldr	r1, [r3, r1]
	str	r2, [r1]
	b	.L8
.L11:
	ldr	r2, .L19+12
	ldr	r2, [r3, r2]
	ldr	r2, [r2]
	adds	r2, r2, #10
	ldr	r1, .L19+12
	ldr	r1, [r3, r1]
	str	r2, [r1]
	b	.L9
.L10:
	ldr	r2, .L19+16
	ldr	r2, [r3, r2]
	ldr	r2, [r2]
	adds	r2, r2, #8
	ldr	r1, .L19+16
	ldr	r1, [r3, r1]
	str	r2, [r1]
.L9:
	ldr	r2, .L19+16
	ldr	r2, [r3, r2]
	ldr	r2, [r2]
	cmp	r2, #9
	ble	.L10
	ldr	r2, .L19+16
	ldr	r2, [r3, r2]
	ldr	r2, [r2]
	subs	r2, r2, #1
	ldr	r1, .L19+16
	ldr	r1, [r3, r1]
	str	r2, [r1]
.L8:
	ldr	r2, .L19+12
	ldr	r2, [r3, r2]
	ldr	r2, [r2]
	cmp	r2, #2
	ble	.L11
	ldr	r2, .L19+12
	ldr	r2, [r3, r2]
	ldr	r2, [r2]
	subs	r2, r2, #8
	ldr	r1, .L19+12
	ldr	r1, [r3, r1]
	str	r2, [r1]
.L7:
	ldr	r2, .L19+8
	ldr	r2, [r3, r2]
	ldr	r2, [r2]
	cmp	r2, #2
	bgt	.L12
	ldr	r2, .L19+8
	ldr	r2, [r3, r2]
	ldr	r2, [r2]
	adds	r2, r2, #1
	ldr	r1, .L19+8
	ldr	r1, [r3, r1]
	str	r2, [r1]
.L6:
	ldr	r2, .L19+4
	ldr	r2, [r3, r2]
	ldr	r2, [r2]
	cmp	r2, #1
	bgt	.L13
	ldr	r2, .L19+4
	ldr	r2, [r3, r2]
	ldr	r2, [r2]
	adds	r2, r2, #1
	ldr	r1, .L19+4
	ldr	r1, [r3, r1]
	str	r2, [r1]
.L5:
	ldr	r2, [r7, #12]
	cmp	r2, #19
	ble	.L14
	ldr	r2, [r7, #12]
	subs	r2, r2, #1
	str	r2, [r7, #12]
.L4:
	ldr	r2, [r7, #8]
	cmp	r2, #7
	beq	.L15
	ldr	r2, [r7, #8]
	adds	r2, r2, #1
	str	r2, [r7, #8]
.L3:
	ldr	r2, [r7, #4]
	cmp	r2, #9
	ble	.L16
	ldr	r2, [r7, #4]
	subs	r2, r2, #2
	str	r2, [r7, #4]
.L2:
	ldr	r2, [r7]
	cmp	r2, #19
	ble	.L17
	ldr	r1, [r7, #4]
	ldr	r2, [r7, #12]
	add	r1, r1, r2
	ldr	r2, [r7]
	add	r1, r1, r2
	ldr	r2, [r7, #8]
	add	r2, r2, r1
	ldr	r1, .L19+4
	ldr	r1, [r3, r1]
	ldr	r0, [r1]
	ldr	r1, [r7, #12]
	add	r0, r0, r1
	ldr	r1, .L19+12
	ldr	r1, [r3, r1]
	ldr	r1, [r1]
	subs	r1, r0, r1
	ldr	r0, .L19+16
	ldr	r3, [r3, r0]
	ldr	r3, [r3]
	add	r3, r3, r1
	subs	r3, r2, r3
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L20:
	.align	2
.L19:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	e(GOT)
	.word	f(GOT)
	.word	g(GOT)
	.word	h(GOT)
	.size	EightWhile, .-EightWhile
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	add	r7, sp, #0
	ldr	r3, .L23
.LPIC1:
	add	r3, pc
	ldr	r2, .L23+4
	ldr	r2, [r3, r2]
	mov	r1, r2
	movs	r2, #1
	str	r2, [r1]
	ldr	r2, .L23+8
	ldr	r2, [r3, r2]
	mov	r1, r2
	movs	r2, #2
	str	r2, [r1]
	ldr	r2, .L23+12
	ldr	r2, [r3, r2]
	mov	r1, r2
	movs	r2, #4
	str	r2, [r1]
	ldr	r2, .L23+16
	ldr	r3, [r3, r2]
	mov	r2, r3
	movs	r3, #6
	str	r3, [r2]
	bl	EightWhile(PLT)
	mov	r3, r0
	mov	r0, r3
	pop	{r7, pc}
.L24:
	.align	2
.L23:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+4)
	.word	g(GOT)
	.word	h(GOT)
	.word	e(GOT)
	.word	f(GOT)
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
