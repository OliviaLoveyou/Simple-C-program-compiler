	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global if_ifElse_
	.type if_ifElse_ , %function
if_ifElse_:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #8
.L15:
	ldr r4, =5
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =5
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L18
	b .L19
.L18:
	ldr r4, [fp, #-4]
	ldr r5, =10
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L20
	b .L21
.L19:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L20:
	ldr r4, =25
	str r4, [fp, #-8]
	b .L22
.L21:
	ldr r4, [fp, #-8]
	add r5, r4, #15
	str r5, [fp, #-8]
	b .L22
.L22:
	b .L19

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	mov fp, sp
	sub sp, sp, #0
.L25:
	bl if_ifElse_
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

