	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global doubleWhile
	.type doubleWhile , %function
doubleWhile:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #8
.L20:
	ldr r4, =5
	str r4, [fp, #-8]
	ldr r4, =7
	str r4, [fp, #-4]
	b .L25
.L23:
	ldr r4, [fp, #-8]
	add r5, r4, #30
	str r5, [fp, #-8]
	b .L30
.L24:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L25:
	ldr r4, [fp, #-8]
	ldr r5, =100
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L23
	b .L24
.L28:
	ldr r4, [fp, #-4]
	add r5, r4, #6
	str r5, [fp, #-4]
	b .L30
.L29:
	ldr r4, [fp, #-4]
	sub r5, r4, #100
	str r5, [fp, #-4]
	b .L25
.L30:
	ldr r4, [fp, #-4]
	ldr r5, =100
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L28
	b .L29

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	mov fp, sp
	sub sp, sp, #0
.L35:
	bl doubleWhile
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

