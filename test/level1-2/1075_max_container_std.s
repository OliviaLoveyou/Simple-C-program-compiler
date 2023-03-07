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
	.file	"1075_max_container.sy"
	.text
	.align	1
	.global	maxArea
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	maxArea, %function
maxArea:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	movs	r3, #0
	str	r3, [r7, #8]
	ldr	r3, [r7]
	subs	r3, r3, #1
	str	r3, [r7, #12]
	mov	r3, #-1
	str	r3, [r7, #16]
	b	.L2
.L7:
	ldr	r3, [r7, #8]
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	lsls	r3, r3, #2
	ldr	r1, [r7, #4]
	add	r3, r3, r1
	ldr	r3, [r3]
	cmp	r2, r3
	bge	.L3
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	subs	r3, r2, r3
	ldr	r2, [r7, #8]
	lsls	r2, r2, #2
	ldr	r1, [r7, #4]
	add	r2, r2, r1
	ldr	r2, [r2]
	mul	r3, r2, r3
	str	r3, [r7, #20]
	b	.L4
.L3:
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #8]
	subs	r3, r2, r3
	ldr	r2, [r7, #12]
	lsls	r2, r2, #2
	ldr	r1, [r7, #4]
	add	r2, r2, r1
	ldr	r2, [r2]
	mul	r3, r2, r3
	str	r3, [r7, #20]
.L4:
	ldr	r2, [r7, #20]
	ldr	r3, [r7, #16]
	cmp	r2, r3
	ble	.L5
	ldr	r3, [r7, #20]
	str	r3, [r7, #16]
.L5:
	ldr	r3, [r7, #8]
	lsls	r3, r3, #2
	ldr	r2, [r7, #4]
	add	r3, r3, r2
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	lsls	r3, r3, #2
	ldr	r1, [r7, #4]
	add	r3, r3, r1
	ldr	r3, [r3]
	cmp	r2, r3
	ble	.L6
	ldr	r3, [r7, #12]
	subs	r3, r3, #1
	str	r3, [r7, #12]
	b	.L2
.L6:
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L2:
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #12]
	cmp	r2, r3
	blt	.L7
	ldr	r3, [r7, #16]
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	maxArea, .-maxArea
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 48
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r4, r7, lr}
	sub	sp, sp, #52
	add	r7, sp, #0
	ldr	r4, .L12
.LPIC0:
	add	r4, pc
	ldr	r3, .L12+4
	ldr	r3, [r4, r3]
	ldr	r3, [r3]
	str	r3, [r7, #44]
	movs	r3, #3
	str	r3, [r7, #4]
	movs	r3, #3
	str	r3, [r7, #8]
	movs	r3, #9
	str	r3, [r7, #12]
	movs	r3, #0
	str	r3, [r7, #16]
	movs	r3, #0
	str	r3, [r7, #20]
	movs	r3, #1
	str	r3, [r7, #24]
	movs	r3, #1
	str	r3, [r7, #28]
	movs	r3, #5
	str	r3, [r7, #32]
	movs	r3, #7
	str	r3, [r7, #36]
	movs	r3, #8
	str	r3, [r7, #40]
	movs	r3, #10
	str	r3, [r7]
	adds	r3, r7, #4
	ldr	r1, [r7]
	mov	r0, r3
	bl	maxArea(PLT)
	str	r0, [r7]
	ldr	r3, [r7]
	mov	r0, r3
	ldr	r3, .L12+4
	ldr	r3, [r4, r3]
	ldr	r2, [r7, #44]
	ldr	r3, [r3]
	cmp	r2, r3
	beq	.L11
	bl	__stack_chk_fail(PLT)
.L11:
	adds	r7, r7, #52
	mov	sp, r7
	@ sp needed
	pop	{r4, r7, pc}
.L13:
	.align	2
.L12:
	.word	_GLOBAL_OFFSET_TABLE_-(.LPIC0+4)
	.word	__stack_chk_guard(GOT)
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
