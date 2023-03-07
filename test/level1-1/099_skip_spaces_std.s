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
	.file	"099_skip_spaces.sy"
	.text
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 416
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #420
	add	r7, sp, #0
	ldr	r4, .L8
.LPIC0:
	add	r4, pc
	ldr	r3, .L8+4
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	str	r3, [r7, #412]
	adds	r3, r7, #4
	movs	r2, #0
	str	r2, [r3]
	add	r3, r7, #8
	movs	r2, #0
	str	r2, [r3]
	b	.L2
.L3:
	bl	getint(PLT)
	mov	r1, r0
	add	r3, r7, #12
	adds	r2, r7, #4
	ldr	r2, [r2]
	str	r1, [r3, r2, lsl #2]
	adds	r3, r7, #4
	adds	r2, r7, #4
	ldr	r2, [r2]
	adds	r2, r2, #1
	str	r2, [r3]
.L2:
	bl	getint(PLT)
	mov	r3, r0
	cmp	r3, #0
	bne	.L3
	b	.L4
.L5:
	adds	r3, r7, #4
	adds	r2, r7, #4
	ldr	r2, [r2]
	subs	r2, r2, #1
	str	r2, [r3]
	add	r3, r7, #12
	adds	r2, r7, #4
	ldr	r2, [r2]
	ldr	r2, [r3, r2, lsl #2]
	add	r3, r7, #8
	add	r1, r7, #8
	ldr	r1, [r1]
	add	r2, r2, r1
	str	r2, [r3]
.L4:
	adds	r3, r7, #4
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L5
	add	r3, r7, #8
	ldr	r3, [r3]
	movw	r2, #14933
	movt	r2, 26546
	smull	r1, r2, r3, r2
	asrs	r1, r2, #5
	asrs	r2, r3, #31
	subs	r2, r1, r2
	movs	r1, #79
	mul	r2, r1, r2
	subs	r2, r3, r2
	mov	r3, r2
	mov	r0, r3
	ldr	r3, .L8+4
	ldr	r3, [r4, r3]
	ldr	r2, [r7, #412]
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L7
	bl	__stack_chk_fail(PLT)
.L7:
	add	r7, r7, #420
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L9:
	.align	2
.L8:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	__stack_chk_guard(GOT)
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
