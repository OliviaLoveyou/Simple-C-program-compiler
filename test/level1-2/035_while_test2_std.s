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
	.file	"035_while_test2.sy"
	.text
	.align	1
	.global	FourWhile
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	FourWhile, %function
FourWhile:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #20
	add	r7, sp, #0
	movs	r3, #5
	str	r3, [r7]
	movs	r3, #6
	str	r3, [r7, #4]
	movs	r3, #7
	str	r3, [r7, #8]
	movs	r3, #10
	str	r3, [r7, #12]
	b	.L2
.L9:
	ldr	r3, [r7]
	adds	r3, r3, #3
	str	r3, [r7]
	b	.L3
.L8:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	b	.L4
.L7:
	ldr	r3, [r7, #8]
	subs	r3, r3, #1
	str	r3, [r7, #8]
	b	.L5
.L6:
	ldr	r3, [r7, #12]
	adds	r3, r3, #3
	str	r3, [r7, #12]
.L5:
	ldr	r3, [r7, #12]
	cmp	r3, #19
	ble	.L6
	ldr	r3, [r7, #12]
	subs	r3, r3, #1
	str	r3, [r7, #12]
.L4:
	ldr	r3, [r7, #8]
	cmp	r3, #7
	beq	.L7
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L3:
	ldr	r3, [r7, #4]
	cmp	r3, #9
	ble	.L8
	ldr	r3, [r7, #4]
	subs	r3, r3, #2
	str	r3, [r7, #4]
.L2:
	ldr	r3, [r7]
	cmp	r3, #19
	ble	.L9
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	add	r2, r2, r3
	ldr	r3, [r7]
	add	r2, r2, r3
	ldr	r3, [r7, #8]
	add	r3, r3, r2
	mov	r0, r3
	adds	r7, r7, #20
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	FourWhile, .-FourWhile
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
	bl	FourWhile(PLT)
	mov	r3, r0
	mov	r0, r3
	pop	{r7, pc}
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
