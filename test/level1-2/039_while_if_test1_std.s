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
	.file	"039_while_if_test1.sy"
	.text
	.align	1
	.global	whileIf
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	whileIf, %function
whileIf:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7]
	movs	r3, #0
	str	r3, [r7, #4]
	b	.L2
.L6:
	ldr	r3, [r7]
	cmp	r3, #5
	bne	.L3
	movs	r3, #25
	str	r3, [r7, #4]
	b	.L4
.L3:
	ldr	r3, [r7]
	cmp	r3, #10
	bne	.L5
	movs	r3, #42
	str	r3, [r7, #4]
	b	.L4
.L5:
	ldr	r3, [r7]
	lsls	r3, r3, #1
	str	r3, [r7, #4]
.L4:
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
.L2:
	ldr	r3, [r7]
	cmp	r3, #99
	ble	.L6
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	whileIf, .-whileIf
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
	bl	whileIf(PLT)
	mov	r3, r0
	mov	r0, r3
	pop	{r7, pc}
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
