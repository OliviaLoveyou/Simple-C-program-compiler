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
	.file	"069_greatest_common_divisor.sy"
	.text
	.global	__aeabi_idivmod
	.align	1
	.global	fun
	.syntax unified
	.thumb
	.thumb_func
	.fpu vfpv3-d16
	.type	fun, %function
fun:
	@ args = 0, pretend = 0, frame = 16
	@ frame_needed = 1, uses_anonymous_args = 0
	push	{r7, lr}
	sub	sp, sp, #16
	add	r7, sp, #0
	str	r0, [r7, #4]
	str	r1, [r7]
	b	.L2
.L3:
	ldr	r3, [r7, #4]
	ldr	r1, [r7]
	mov	r0, r3
	bl	__aeabi_idivmod(PLT)
	mov	r3, r1
	str	r3, [r7, #12]
	ldr	r3, [r7]
	str	r3, [r7, #4]
	ldr	r3, [r7, #12]
	str	r3, [r7]
.L2:
	ldr	r3, [r7]
	cmp	r3, #0
	bgt	.L3
	ldr	r3, [r7, #4]
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	fun, .-fun
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
	bl	getint(PLT)
	str	r0, [r7, #4]
	bl	getint(PLT)
	str	r0, [r7, #8]
	ldr	r1, [r7, #8]
	ldr	r0, [r7, #4]
	bl	fun(PLT)
	str	r0, [r7, #12]
	ldr	r0, [r7, #12]
	bl	putint(PLT)
	movs	r3, #0
	mov	r0, r3
	adds	r7, r7, #16
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.size	main, .-main
	.ident	"GCC: (Ubuntu/Linaro 7.5.0-3ubuntu1~18.04) 7.5.0"
	.section	.note.GNU-stack,"",%progbits
