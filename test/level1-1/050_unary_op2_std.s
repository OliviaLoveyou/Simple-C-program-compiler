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
	.file	"050_unary_op2.sy"
	.text
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
	movs	r3, #56
	str	r3, [r7]
	movs	r3, #4
	str	r3, [r7, #4]
	ldr	r3, [r7]
	adds	r3, r3, #4
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	str	r3, [r7]
	ldr	r3, [r7]
	cmp	r3, #0
	bne	.L2
	mov	r3, #-1
	str	r3, [r7]
	b	.L3
.L2:
	ldr	r3, [r7, #4]
	str	r3, [r7]
.L3:
	ldr	r0, [r7]
	bl	putint(PLT)
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits