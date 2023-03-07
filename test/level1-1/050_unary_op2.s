	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	push {r7}
	mov fp, sp
	sub sp, sp, #8
.L40:
	ldr r4, =56
	str r4, [fp, #-8]
	ldr r4, =4
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =0
	sub r6, r5, #4
	sub r5, r4, r6
	ldr r4, [fp, #-4]
	ldr r6, =0
	add r7, r6, r4
	add r4, r5, r7
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	eor r5, r4, #1
	eor r4, r5, #1
	eor r5, r4, #1
	mov r4, r5
	ldr r5, =0
	sub r6, r5, r4
	ldr r4, =0
	add r5, r4, r6
	ldr r4, =0
	cmp r5, r4
	mov r4, #0
	movne r4, #1
	bne .L49
	b .L50
.L49:
	ldr r4, =0
	sub r5, r4, #1
	ldr r4, =0
	sub r6, r4, r5
	ldr r4, =0
	sub r5, r4, r6
	str r5, [fp, #-8]
	b .L51
.L50:
	ldr r4, [fp, #-4]
	ldr r5, =0
	add r6, r5, r4
	ldr r4, =0
	add r5, r4, r6
	str r5, [fp, #-8]
	b .L51
.L51:
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #8
	pop {r7}
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

