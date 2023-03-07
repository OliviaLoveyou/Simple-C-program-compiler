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
	mov fp, sp
	sub sp, sp, #4
.L23:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
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
	bne .L25
	b .L26
.L25:
	ldr r4, =0
	sub r5, r4, #1
	ldr r4, =0
	sub r6, r4, r5
	ldr r4, =0
	sub r5, r4, r6
	str r5, [fp, #-4]
	b .L27
.L26:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L27
.L27:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

