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
	sub sp, sp, #4
.L4:
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =2
	mul r6, r4, r5
	add r4, r6, #1
	mov r0, r4
	add sp, sp, #4
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

