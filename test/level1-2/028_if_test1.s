	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global ifElse
	.type ifElse , %function
ifElse:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #4
.L11:
	ldr r4, =5
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =5
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L13
	b .L14
.L13:
	ldr r4, =25
	str r4, [fp, #-4]
	b .L15
.L14:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-4]
	b .L15
.L15:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r6}
	pop {r5}
	pop {r4}
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
	sub sp, sp, #0
.L18:
	bl ifElse
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

