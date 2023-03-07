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
	.file	"057_if_complex_expr.sy"
	.text
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
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	movs	r3, #5
	str	r3, [r7, #4]
	movs	r3, #5
	str	r3, [r7, #8]
	movs	r3, #1
	str	r3, [r7, #12]
	mvn	r3, #1
	str	r3, [r7, #16]
	movs	r3, #2
	str	r3, [r7, #20]
	ldr	r3, [r7, #16]
	cmp	r3, #-1
	blt	.L2
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	beq	.L3
	ldr	r3, [r7, #12]
	adds	r3, r3, #3
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L3
.L2:
	ldr	r0, [r7, #20]
	bl	putint(PLT)
.L3:
	ldr	r3, [r7, #16]
	cmp	r3, #0
	and	r3, r3, #1
	it	lt
	rsblt	r3, r3, #0
	adds	r3, r3, #67
	cmp	r3, #0
	blt	.L4
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	cmp	r2, r3
	beq	.L5
	ldr	r3, [r7, #12]
	and	r3, r3, #1
	cmp	r3, #0
	beq	.L5
.L4:
	movs	r3, #4
	str	r3, [r7, #20]
	ldr	r0, [r7, #20]
	bl	putint(PLT)
.L5:
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #24
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
