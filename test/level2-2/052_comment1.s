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
	mov fp, sp
	sub sp, sp, #4
.L3:
	ldr r4, =5
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

