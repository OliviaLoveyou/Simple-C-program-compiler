	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global f
	.type f , %function
f:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #8
.L30:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mul r6, r4, r5
	mov r0, r6
	add sp, sp, #8
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

	.global g
	.type g , %function
g:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #8
.L35:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	sdiv r6, r4, r5
	mul r6, r6, r5
	sub r5, r4, r6
	mov r0, r5
	add sp, sp, #8
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

	.global h
	.type h , %function
h:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	push {r7}
	mov fp, sp
	sub sp, sp, #8
.L40:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl g
	mov r6, r0
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl f
	mov r4, r0
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl f
	mov r6, r0
	mov r0, r4
	mov r1, r5
	mov r2, r6
	ldr r3, =4
	bl g
	mov r7, r0
	mov r0, r4
	mov r1, r5
	mov r2, r6
	ldr r3, =4
	push {r7}
	bl f
	mov r4, r0
	mov r0, r4
	add sp, sp, #8
	pop {r7}
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
.L43:
	ldr r0, =11
	ldr r1, =3
	bl h
	mov r4, r0
	ldr r0, =11
	ldr r1, =3
	mov r2, r4
	bl putint
	mov r0, #0
	add sp, sp, #0
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

