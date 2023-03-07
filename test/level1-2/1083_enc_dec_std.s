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
	.file	"1083_enc_dec.sy"
	.text
	.align	1
	.global	enc
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	enc, %function
enc:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #25
	ble	.L2
	ldr	r3, [r7, #4]
	adds	r3, r3, #60
	str	r3, [r7, #4]
	b	.L3
.L2:
	ldr	r3, [r7, #4]
	subs	r3, r3, #15
	str	r3, [r7, #4]
.L3:
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	enc, .-enc
	.align	1
	.global	dec
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	dec, %function
dec:
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #12
	add	r7, sp, #0
	str	r0, [r7, #4]
	ldr	r3, [r7, #4]
	cmp	r3, #85
	ble	.L6
	ldr	r3, [r7, #4]
	subs	r3, r3, #59
	str	r3, [r7, #4]
	b	.L7
.L6:
	ldr	r3, [r7, #4]
	adds	r3, r3, #14
	str	r3, [r7, #4]
.L7:
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	dec, .-dec
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
	bl	enc(PLT)
	str	r0, [r7, #4]
	ldr	r0, [r7, #4]
	bl	dec(PLT)
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
