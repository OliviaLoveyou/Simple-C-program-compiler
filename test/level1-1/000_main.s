	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	mov fp, sp
	sub sp, sp, #0
.L0:
	mov r0, #3
	add sp, sp, #0
	pop {fp}
	pop {lr}
	bx lr

