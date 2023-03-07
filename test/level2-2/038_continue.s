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
	sub sp, sp, #8
.L19:
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L24
.L22:
	ldr r4, [fp, #-8]
	ldr r5, =50
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L25
	b .L26
.L23:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L24:
	ldr r4, [fp, #-8]
	ldr r5, =100
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L22
	b .L23
.L25:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L26
.L26:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L24

