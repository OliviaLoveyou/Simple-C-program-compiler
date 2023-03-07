	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 3
	.global b
	.align 4
	.size b, 4
b:
	.word 5
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
.L6:
	ldr r4, =5
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_b0
	ldr r6, [r5]
	add r5, r4, r6
	mov r0, r5
	add sp, sp, #4
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

addr_a0:
	.word a
addr_b0:
	.word b
