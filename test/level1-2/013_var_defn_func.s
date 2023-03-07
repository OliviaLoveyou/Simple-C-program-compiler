	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global defn
	.type defn , %function
defn:
	push {lr}
	push {fp}
	mov fp, sp
	sub sp, sp, #0
.L4:
	mov r0, #4
	add sp, sp, #0
	pop {fp}
	pop {lr}
	bx lr

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	mov fp, sp
	sub sp, sp, #4
.L5:
	bl defn
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

