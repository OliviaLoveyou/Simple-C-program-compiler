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
	.file	"048_stmt_expr.sy"
	.text
	.comm	k,4,4
	.global	n
	.section	.rodata
	.align	2
	.type	n, %object
	.size	n, 4
n:
	.word	10
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
	push	{r4, r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	ldr	r4, .L5
.LPIC0:
	add	r4, pc
	movs	r3, #0
	str	r3, [r7, #4]
	ldr	r3, .L5+4
	ldr	r3, [r4, r3]
	mov	r2, r3
	movs	r3, #1
	str	r3, [r2]
	b	.L2
.L3:
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	str	r3, [r7, #4]
	ldr	r3, .L5+4
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	lsls	r3, r3, #1
	ldr	r2, .L5+4
	ldr	r2, [r4, r2]
	str	r3, [r2]
.L2:
	movs	r3, #10
	subs	r3, r3, #1
	ldr	r2, [r7, #4]
	cmp	r2, r3
	ble	.L3
	ldr	r3, .L5+4
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	mov	r0, r3
	bl	putint(PLT)
	ldr	r3, .L5+4
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	mov	r0, r3
	adds	r7, r7, #12
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L6:
	.align	2
.L5:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	k(GOT)
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
