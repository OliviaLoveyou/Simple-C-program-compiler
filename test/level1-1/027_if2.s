	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.text
	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #0
.L4:
	ldr r4, =10
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, addr_a0
	ldr r5, [r4]
	ldr r4, =0
	cmp r5, r4
	mov r4, #0
	movgt r4, #1
	bgt .L5
	b .L6
.L5:
	mov r0, #1
	add sp, sp, #0
	bx lr
	b .L7
.L6:
	mov r0, #0
	add sp, sp, #0
	bx lr
	b .L7
.L7:

addr_a0:
	.word a
