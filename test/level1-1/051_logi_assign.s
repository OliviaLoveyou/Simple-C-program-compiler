	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.global b
	.align 4
	.size b, 4
b:
	.word 0
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
.L18:
	bl getint
	mov r4, r0
	ldr r5, addr_a0
	str r4, [r5]
	bl getint
	mov r4, r0
	ldr r5, addr_b0
	str r4, [r5]
	ldr r4, addr_a0
	ldr r5, [r4]
	ldr r4, addr_b0
	ldr r6, [r4]
	cmp r5, r6
	mov r4, #0
	moveq r4, #1
	beq .L23
	b .L21
.L20:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L22
.L21:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L22
.L22:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L23:
	ldr r4, addr_a0
	ldr r5, [r4]
	ldr r4, =3
	cmp r5, r4
	mov r4, #0
	movne r4, #1
	bne .L20
	b .L21

addr_a0:
	.word a
addr_b0:
	.word b
