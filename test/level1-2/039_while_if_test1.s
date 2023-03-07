	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global whileIf
	.type whileIf , %function
whileIf:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #8
.L21:
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L26
.L24:
	ldr r4, [fp, #-8]
	ldr r5, =5
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L27
	b .L28
.L25:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L26:
	ldr r4, [fp, #-8]
	ldr r5, =100
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L24
	b .L25
.L27:
	ldr r4, =25
	str r4, [fp, #-4]
	b .L29
.L28:
	ldr r4, [fp, #-8]
	ldr r5, =10
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L30
	b .L31
.L29:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L26
.L30:
	ldr r4, =42
	str r4, [fp, #-4]
	b .L32
.L31:
	ldr r4, [fp, #-8]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-4]
	b .L32
.L32:
	b .L29

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	mov fp, sp
	sub sp, sp, #0
.L37:
	bl whileIf
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

