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
	.file	"1076_int_factor_sum.sy"
	.text
	.comm	N,4,4
	.comm	newline,4,4
	.global	__aeabi_idivmod
	.align	1
	.global	factor
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	factor, %function
factor:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #12]
	movs	r3, #1
	str	r3, [r7, #8]
	b	.L2
.L4:
	ldr	r3, [r7, #4]
	ldr	r1, [r7, #8]
	mov	r0, r3
	bl	__aeabi_idivmod(PLT)
	mov	r3, r1
	cmp	r3, #0
	bne	.L3
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	add	r3, r3, r2
	str	r3, [r7, #12]
.L3:
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L2:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	ldr	r2, [r7, #8]
	cmp	r2, r3
	blt	.L4
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	factor, .-factor
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
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	ldr	r3, .L8
.LPIC0:
	add	r3, pc
	ldr	r2, .L8+4
	ldr	r2, [r3, r2]
	mov	r1, r2
	movs	r2, #4
	str	r2, [r1]
	ldr	r2, .L8+8
	ldr	r3, [r3, r2]
	mov	r2, r3
	movs	r3, #10
	str	r3, [r2]
	movw	r3, #1478
	str	r3, [r7, #4]
	ldr	r0, [r7, #4]
	bl	factor(PLT)
	mov	r3, r0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L9:
	.align	2
.L8:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	N(GOT)
	.word	newline(GOT)
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
