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
	.file	"041_while_if_test3.sy"
	.text
	.align	1
	.global	deepWhileBr
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	deepWhileBr, %function
deepWhileBr:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	add	r3, r3, r2
	str	r3, [r7, #12]
	b	.L2
.L3:
	movs	r3, #42
	str	r3, [r7, #16]
	ldr	r3, [r7, #12]
	cmp	r3, #99
	bgt	.L2
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #16]
	add	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	cmp	r3, #99
	ble	.L2
	ldr	r3, [r7, #16]
	lsls	r3, r3, #1
	str	r3, [r7, #20]
	ldr	r3, [r7, #20]
	lsls	r3, r3, #1
	str	r3, [r7, #12]
.L2:
	ldr	r3, [r7, #12]
	cmp	r3, #74
	ble	.L3
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	deepWhileBr, .-deepWhileBr
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
	movs	r3, #2
	str	r3, [r7, #4]
	ldr	r1, [r7, #4]
	ldr	r0, [r7, #4]
	bl	deepWhileBr(PLT)
	mov	r3, r0
	mov	r0, r3
	adds	r7, r7, #8
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
