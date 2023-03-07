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
	.file	"051_logi_assign.sy"
	.text
	.comm	a,4,4
	.comm	b,4,4
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	ldr	r4, .L5
.LPIC0:
	add	r4, pc
	bl	getint(PLT)
	mov	r2, r0
	ldr	r3, .L5+4
	ldr	r3, [r4, r3]
	str	r2, [r3]
	bl	getint(PLT)
	mov	r2, r0
	ldr	r3, .L5+8
	ldr	r3, [r4, r3]
	str	r2, [r3]
	ldr	r3, .L5+4
	ldr	r3, [r4, r3]
	ldr	r2, [r3]
	ldr	r3, .L5+8
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	cmp	r2, r3
	bne	.L2
	ldr	r3, .L5+4
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	cmp	r3, #3
	beq	.L2
	movs	r3, #1
	str	r3, [r7, #4]
	b	.L3
.L2:
	movs	r3, #0
	str	r3, [r7, #4]
.L3:
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L6:
	.align	2
.L5:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	a(GOT)
	.word	b(GOT)
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
