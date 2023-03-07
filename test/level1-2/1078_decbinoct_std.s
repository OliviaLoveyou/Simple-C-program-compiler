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
	.file	"1078_decbinoct.sy"
	.text
	.align	1
	.global	dec2bin
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	dec2bin, %function
dec2bin:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #8]
	movs	r3, #1
	str	r3, [r7, #12]
	ldr	r3, [r7, #4]
	str	r3, [r7, #16]
	b	.L2
.L3:
	ldr	r3, [r7, #16]
	cmp	r3, #0
	and	r3, r3, #1
	it	lt
	rsblt	r3, r3, #0
	str	r3, [r7, #20]
	ldr	r3, [r7, #12]
	ldr	r2, [r7, #20]
	mul	r3, r2, r3
	ldr	r2, [r7, #8]
	add	r3, r3, r2
	str	r3, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r2, #10
	mul	r3, r2, r3
	str	r3, [r7, #12]
	ldr	r3, [r7, #16]
	lsrs	r2, r3, #31
	add	r3, r3, r2
	asrs	r3, r3, #1
	str	r3, [r7, #16]
.L2:
	ldr	r3, [r7, #16]
	cmp	r3, #0
	bne	.L3
	ldr	r3, [r7, #8]
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	dec2bin, .-dec2bin
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
	mov	r3, #400
	str	r3, [r7]
	ldr	r0, [r7]
	bl	dec2bin(PLT)
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	putint(PLT)
	movs	r3, #10
	str	r3, [r7, #4]
	ldr	r0, [r7, #4]
	bl	putch(PLT)
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
