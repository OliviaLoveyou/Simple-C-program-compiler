	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global reverse
	.type reverse , %function
reverse:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #8
.L24:
	str r0, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, =1
	cmp r4, r5
	mov r4, #0
	movle r4, #1
	ble .L27
	b .L28
.L27:
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L29
.L28:
	mov r0, v6
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	mov r0, r5
	bl reverse
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L29
.L29:

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	mov fp, sp
	sub sp, sp, #4
.L32:
	ldr r4, =200
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl reverse
	mov r0, #0
	add sp, sp, #4
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

