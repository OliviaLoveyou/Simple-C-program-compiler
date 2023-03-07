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
	.file	"1072_enum.sy"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	movs	r3, #0
	str	r3, [r7]
	movs	r3, #0
	str	r3, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #8]
	b	.L2
.L5:
	ldr	r3, [r7]
	rsb	r2, r3, #100
	ldr	r3, [r7, #4]
	subs	r3, r2, r3
	str	r3, [r7, #8]
	ldr	r2, [r7]
	mov	r3, r2
	lsls	r3, r3, #2
	add	r2, r2, r3
	ldr	r3, [r7, #4]
	add	r2, r2, r3
	ldr	r3, [r7, #8]
	lsrs	r1, r3, #31
	add	r3, r3, r1
	asrs	r3, r3, #1
	add	r3, r3, r2
	cmp	r3, #100
	bne	.L4
	ldr	r0, [r7]
	bl	putint(PLT)
	ldr	r0, [r7, #4]
	bl	putint(PLT)
	ldr	r0, [r7, #8]
	bl	putint(PLT)
	movs	r3, #10
	str	r3, [r7, #12]
	ldr	r0, [r7, #12]
	bl	putch(PLT)
.L4:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
.L3:
	ldr	r3, [r7]
	rsb	r3, r3, #101
	ldr	r2, [r7, #4]
	cmp	r2, r3
	blt	.L5
	ldr	r3, [r7]
	adds	r3, r3, #1
	str	r3, [r7]
.L2:
	ldr	r3, [r7]
	cmp	r3, #20
	ble	.L3
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
