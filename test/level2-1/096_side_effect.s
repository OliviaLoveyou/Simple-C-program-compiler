	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word %t0
	.global b
	.align 4
	.size b, 4
b:
	.word 1
	.text
	.global inc_a
	.type inc_a , %function
inc_a:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #4
.L76:
	ldr r4, addr_a0
	ldr r5, [r4]
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #4
.L80:
	ldr r4, =5
	str r4, [fp, #-4]
	b .L84
.L82:
	bl inc_a
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L88
	b .L86
.L83:
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r0, =32
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r0, =10
	bl putch
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L84:
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movge r4, #1
	bge .L82
	b .L83
.L85:
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r0, =32
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r0, =10
	bl putch
	b .L86
.L86:
	ldr r0, =10
	bl inc_a
	mov r4, r0
	ldr r5, =14
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L89
	b .L92
.L87:
	bl inc_a
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L85
	b .L86
.L88:
	bl inc_a
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L87
	b .L86
.L89:
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r0, =10
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	ldr r4, =2
	mul r6, r5, r4
	ldr r4, addr_b0
	str r6, [r4]
	b .L91
.L90:
	ldr r0, =10
	bl inc_a
	mov r4, r0
	b .L91
.L91:
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L84
.L92:
	ldr r0, =10
	bl inc_a
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L93
	b .L90
.L93:
	ldr r0, =10
	bl inc_a
	mov r4, r0
	ldr r0, =10
	bl inc_a
	mov r5, r0
	sub r6, r4, r5
	add r4, r6, #1
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L89
	b .L90

addr_a0:
	.word a
addr_b0:
	.word b
