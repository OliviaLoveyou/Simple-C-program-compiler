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
	.file	"102_short_circuit3.sy"
	.text
	.comm	a,4,4
	.comm	b,4,4
	.comm	d,4,4
	.align	1
	.global	set_a
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	set_a, %function
set_a:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L3
.LPIC0:
	add	r3, pc
	ldr	r2, .L3+4
	ldr	r2, [r3, r2]
	mov	r1, r2
	ldr	r2, [r7, #4]
	str	r2, [r1]
	ldr	r2, .L3+4
	ldr	r3, [r3, r2]
	ldr	r3, [r3]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L4:
	.align	2
.L3:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	a(GOT)
	.size	set_a, .-set_a
	.align	1
	.global	set_b
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	set_b, %function
set_b:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L7
.LPIC1:
	add	r3, pc
	ldr	r2, .L7+4
	ldr	r2, [r3, r2]
	mov	r1, r2
	ldr	r2, [r7, #4]
	str	r2, [r1]
	ldr	r2, .L7+4
	ldr	r3, [r3, r2]
	ldr	r3, [r3]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L8:
	.align	2
.L7:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC1+4)
	.word	b(GOT)
	.size	set_b, .-set_b
	.align	1
	.global	set_d
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	set_d, %function
set_d:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, .L11
.LPIC2:
	add	r3, pc
	ldr	r2, .L11+4
	ldr	r2, [r3, r2]
	mov	r1, r2
	ldr	r2, [r7, #4]
	str	r2, [r1]
	ldr	r2, .L11+4
	ldr	r3, [r3, r2]
	ldr	r3, [r3]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L12:
	.align	2
.L11:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC2+4)
	.word	d(GOT)
	.size	set_d, .-set_d
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #28
	add	r7, sp, #0
	ldr	r4, .L29
.LPIC3:
	add	r4, pc
	ldr	r3, .L29+4
	ldr	r3, [r4, r3]
	mov	r2, r3
	movs	r3, #2
	str	r3, [r2]
	ldr	r3, .L29+8
	ldr	r3, [r4, r3]
	mov	r2, r3
	movs	r3, #3
	str	r3, [r2]
	movs	r0, #0
	bl	set_a(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L14
	movs	r0, #1
	bl	set_b(PLT)
.L14:
	ldr	r3, .L29+4
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	mov	r0, r3
	bl	putint(PLT)
	movs	r0, #32
	bl	putch(PLT)
	ldr	r3, .L29+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	mov	r0, r3
	bl	putint(PLT)
	movs	r0, #32
	bl	putch(PLT)
	ldr	r3, .L29+4
	ldr	r3, [r4, r3]
	mov	r2, r3
	movs	r3, #2
	str	r3, [r2]
	ldr	r3, .L29+8
	ldr	r3, [r4, r3]
	mov	r2, r3
	movs	r3, #3
	str	r3, [r2]
	movs	r0, #0
	bl	set_a(PLT)
	mov	r3, r0
	cmp	r3, #0
	beq	.L15
	movs	r0, #1
	bl	set_b(PLT)
.L15:
	ldr	r3, .L29+4
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	mov	r0, r3
	bl	putint(PLT)
	movs	r0, #32
	bl	putch(PLT)
	ldr	r3, .L29+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	mov	r0, r3
	bl	putint(PLT)
	movs	r0, #10
	bl	putch(PLT)
	movs	r3, #1
	str	r3, [r7]
	ldr	r3, .L29+12
	ldr	r3, [r4, r3]
	mov	r2, r3
	movs	r3, #2
	str	r3, [r2]
	ldr	r3, [r7]
	cmp	r3, #0
	ble	.L16
	movs	r0, #3
	bl	set_d(PLT)
.L16:
	ldr	r3, .L29+12
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	mov	r0, r3
	bl	putint(PLT)
	movs	r0, #32
	bl	putch(PLT)
	ldr	r3, [r7]
	cmp	r3, #1
	ble	.L17
	movs	r0, #4
	bl	set_d(PLT)
.L17:
	ldr	r3, .L29+12
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	mov	r0, r3
	bl	putint(PLT)
	movs	r0, #10
	bl	putch(PLT)
	movs	r0, #65
	bl	putch(PLT)
	movs	r0, #68
	bl	putch(PLT)
	movs	r0, #70
	bl	putch(PLT)
	movs	r0, #10
	bl	putch(PLT)
	movs	r3, #0
	str	r3, [r7, #4]
	movs	r3, #1
	str	r3, [r7, #8]
	movs	r3, #2
	str	r3, [r7, #12]
	movs	r3, #3
	str	r3, [r7, #16]
	movs	r3, #4
	str	r3, [r7, #20]
	b	.L18
.L20:
	movs	r0, #32
	bl	putch(PLT)
.L18:
	ldr	r3, [r7, #4]
	cmp	r3, #0
	beq	.L19
	ldr	r3, [r7, #8]
	cmp	r3, #0
	bne	.L20
.L19:
	ldr	r3, [r7, #4]
	cmp	r3, #0
	bne	.L21
	ldr	r3, [r7, #8]
	cmp	r3, #0
	beq	.L22
.L21:
	movs	r0, #67
	bl	putch(PLT)
.L22:
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	bge	.L23
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bgt	.L24
.L23:
	movs	r0, #72
	bl	putch(PLT)
.L24:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	blt	.L28
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #16]
	cmp	r2, r3
	beq	.L28
	movs	r0, #73
	bl	putch(PLT)
.L28:
	movs	r0, #74
	bl	putch(PLT)
	ldr	r3, [r7, #8]
	cmp	r3, #0
	ite	eq
	moveq	r3, #1
	movne	r3, #0
	uxtb	r3, r3
	mov	r2, r3
	ldr	r3, [r7, #4]
	cmp	r3, r2
	bne	.L26
	movs	r0, #75
	bl	putch(PLT)
.L26:
	movs	r0, #10
	bl	putch(PLT)
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L30:
	.align	2
.L29:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC3+4)
	.word	a(GOT)
	.word	b(GOT)
	.word	d(GOT)
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
