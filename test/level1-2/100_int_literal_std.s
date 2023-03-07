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
	.file	"100_int_literal.sy"
	.text
	.global	s
	.bss
	.align	2
	.type	s, %object
	.size	s, 4
s:
	.space	4
	.text
	.align	1
	.global	get_ans_se
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	get_ans_se, %function
get_ans_se:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #20]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bne	.L2
	movs	r3, #1
	str	r3, [r7, #20]
.L2:
	ldr	r3, [r7, #12]
	lsls	r3, r3, #1
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #20]
	add	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, .L4
.LPIC0:
	add	r3, pc
	ldr	r2, [r3]
	ldr	r3, [r7, #12]
	add	r3, r3, r2
	ldr	r2, .L4+4
.LPIC1:
	add	r2, pc
	str	r3, [r2]
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
.L5:
	.align	2
.L4:
	.word	s-(.LPIC0+4)
	.word	s-(.LPIC1+4)
	.size	get_ans_se, .-get_ans_se
	.align	1
	.global	get_ans
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	get_ans, %function
get_ans:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 1, uses_anonymous_args = 0
	@ link register save eliminated.
	push	{r7}
	sub	sp, sp, #28
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	movs	r3, #0
	str	r3, [r7, #20]
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bne	.L7
	movs	r3, #1
	str	r3, [r7, #20]
.L7:
	ldr	r3, [r7, #12]
	lsls	r3, r3, #1
	str	r3, [r7, #12]
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #20]
	add	r3, r3, r2
	str	r3, [r7, #12]
	ldr	r3, [r7, #12]
	mov	r0, r3
	adds	r7, r7, #28
	mov	sp, r7
	@ sp needed
	ldr	r7, [sp], #4
	bx	lr
	.size	get_ans, .-get_ans
	.align	1
	.global	main
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	main, %function
main:
	@ args = 0, pretend = 0, frame = 40
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #40
	add	r7, sp, #0
	mov	r3, #-2147483648
	str	r3, [r7, #4]
	mov	r3, #-2147483648
	str	r3, [r7, #8]
	movs	r3, #1
	movt	r3, 32768
	str	r3, [r7, #12]
	mvn	r3, #-2147483648
	str	r3, [r7, #16]
	movw	r3, #65534
	movt	r3, 32767
	str	r3, [r7, #20]
	ldr	r2, [r7, #8]
	ldr	r1, [r7, #4]
	movs	r0, #0
	bl	get_ans(PLT)
	str	r0, [r7, #24]
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	ldr	r2, [r7, #12]
	mov	r1, r3
	ldr	r0, [r7, #24]
	bl	get_ans(PLT)
	str	r0, [r7, #24]
	ldr	r3, [r7, #16]
	mvns	r3, r3
	mov	r2, r3
	ldr	r1, [r7, #4]
	ldr	r0, [r7, #24]
	bl	get_ans(PLT)
	str	r0, [r7, #24]
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	mov	r2, r3
	ldr	r1, [r7, #4]
	ldr	r0, [r7, #24]
	bl	get_ans(PLT)
	str	r0, [r7, #24]
	ldr	r3, [r7, #8]
	lsrs	r2, r3, #31
	add	r3, r3, r2
	asrs	r3, r3, #1
	mov	r1, r3
	ldr	r3, [r7, #12]
	lsrs	r2, r3, #31
	add	r3, r3, r2
	asrs	r3, r3, #1
	mov	r2, r3
	ldr	r0, [r7, #24]
	bl	get_ans(PLT)
	str	r0, [r7, #24]
	ldr	r3, [r7, #16]
	mvns	r3, r3
	mov	r2, r3
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #24]
	bl	get_ans(PLT)
	str	r0, [r7, #24]
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	mov	r2, r3
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #24]
	bl	get_ans(PLT)
	str	r0, [r7, #24]
	ldr	r2, [r7, #16]
	ldr	r1, [r7, #12]
	movs	r0, #0
	bl	get_ans(PLT)
	str	r0, [r7, #28]
	ldr	r2, [r7, #20]
	ldr	r1, [r7, #12]
	ldr	r0, [r7, #28]
	bl	get_ans(PLT)
	str	r0, [r7, #28]
	ldr	r2, [r7, #20]
	ldr	r1, [r7, #16]
	ldr	r0, [r7, #28]
	bl	get_ans(PLT)
	str	r0, [r7, #28]
	ldr	r3, [r7, #4]
	lsrs	r2, r3, #31
	add	r3, r3, r2
	asrs	r3, r3, #1
	mov	r1, r3
	ldr	r3, [r7, #8]
	lsrs	r2, r3, #31
	add	r3, r3, r2
	asrs	r3, r3, #1
	mov	r2, r3
	ldr	r0, [r7, #28]
	bl	get_ans(PLT)
	str	r0, [r7, #28]
	ldr	r2, [r7, #8]
	ldr	r1, [r7, #4]
	movs	r0, #0
	bl	get_ans_se(PLT)
	str	r0, [r7, #32]
	ldr	r3, [r7, #4]
	adds	r3, r3, #1
	ldr	r2, [r7, #12]
	mov	r1, r3
	ldr	r0, [r7, #32]
	bl	get_ans_se(PLT)
	str	r0, [r7, #32]
	ldr	r3, [r7, #16]
	mvns	r3, r3
	mov	r2, r3
	ldr	r1, [r7, #4]
	ldr	r0, [r7, #32]
	bl	get_ans_se(PLT)
	str	r0, [r7, #32]
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	mov	r2, r3
	ldr	r1, [r7, #4]
	ldr	r0, [r7, #32]
	bl	get_ans_se(PLT)
	str	r0, [r7, #32]
	ldr	r3, [r7, #8]
	lsrs	r2, r3, #31
	add	r3, r3, r2
	asrs	r3, r3, #1
	mov	r1, r3
	ldr	r3, [r7, #12]
	lsrs	r2, r3, #31
	add	r3, r3, r2
	asrs	r3, r3, #1
	mov	r2, r3
	ldr	r0, [r7, #32]
	bl	get_ans_se(PLT)
	str	r0, [r7, #32]
	ldr	r3, [r7, #16]
	mvns	r3, r3
	mov	r2, r3
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #32]
	bl	get_ans_se(PLT)
	str	r0, [r7, #32]
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	mov	r2, r3
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #32]
	bl	get_ans_se(PLT)
	str	r0, [r7, #32]
	ldr	r2, [r7, #16]
	ldr	r1, [r7, #12]
	movs	r0, #0
	bl	get_ans_se(PLT)
	str	r0, [r7, #36]
	ldr	r2, [r7, #20]
	ldr	r1, [r7, #12]
	ldr	r0, [r7, #36]
	bl	get_ans_se(PLT)
	str	r0, [r7, #36]
	ldr	r2, [r7, #20]
	ldr	r1, [r7, #16]
	ldr	r0, [r7, #36]
	bl	get_ans_se(PLT)
	str	r0, [r7, #36]
	ldr	r3, [r7, #4]
	lsrs	r2, r3, #31
	add	r3, r3, r2
	asrs	r3, r3, #1
	mov	r1, r3
	ldr	r3, [r7, #8]
	lsrs	r2, r3, #31
	add	r3, r3, r2
	asrs	r3, r3, #1
	mov	r2, r3
	ldr	r0, [r7, #36]
	bl	get_ans_se(PLT)
	str	r0, [r7, #36]
	ldr	r2, [r7, #24]
	ldr	r3, [r7, #28]
	add	r2, r2, r3
	ldr	r3, [r7, #32]
	add	r2, r2, r3
	ldr	r3, [r7, #36]
	add	r3, r3, r2
	mov	r0, r3
	adds	r7, r7, #40
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
