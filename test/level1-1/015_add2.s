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
.L9:
	ldr r4, =10
	str r4, [fp, #-8]
	ldr r4, =0
	sub r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	mov r0, r6
	add sp, sp, #8
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
