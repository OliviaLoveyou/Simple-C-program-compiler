	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global n
	.align 4
	.size n, 4
n:
	.word 0
	.text
	.global gcd
	.type gcd , %function
gcd:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #24
.L51:
	str r0, [fp, #-24]
	str r1, [fp, #-20]
	ldr r4, [fp, #-24]
	str r4, [fp, #-16]
	ldr r4, [fp, #-20]
	str r4, [fp, #-12]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L58
	b .L59
.L58:
	ldr r4, [fp, #-24]
	str r4, [fp, #-8]
	ldr r4, [fp, #-20]
	str r4, [fp, #-24]
	ldr r4, [fp, #-8]
	str r4, [fp, #-20]
	b .L59
.L59:
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	sdiv r6, r4, r5
	mul r6, r6, r5
	sub r5, r4, r6
	str r5, [fp, #-4]
	b .L64
.L62:
	ldr r4, [fp, #-20]
	str r4, [fp, #-24]
	ldr r4, [fp, #-4]
	str r4, [fp, #-20]
	ldr r4, [fp, #-24]
	ldr r5, [fp, #-20]
	sdiv r6, r4, r5
	mul r6, r6, r5
	sub r5, r4, r6
	str r5, [fp, #-4]
	b .L64
.L63:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	mul r6, r4, r5
	ldr r4, [fp, #-20]
	sdiv r5, r6, r4
	mov r0, r5
	add sp, sp, #24
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L64:
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L62
	b .L63

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #8
.L71:
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl gcd
	mov r4, r0
	mov r0, r4
	add sp, sp, #8
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

addr_n0:
	.word n
