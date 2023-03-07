	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global FourWhile
	.type FourWhile , %function
FourWhile:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	push {r7}
	mov fp, sp
	sub sp, sp, #16
.L46:
	ldr r4, =5
	str r4, [fp, #-16]
	ldr r4, =6
	str r4, [fp, #-12]
	ldr r4, =7
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	b .L53
.L51:
	ldr r4, [fp, #-16]
	add r5, r4, #3
	str r5, [fp, #-16]
	b .L58
.L52:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-4]
	add r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-8]
	add r6, r5, r4
	mov r0, r6
	add sp, sp, #16
	pop {r7}
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L53:
	ldr r4, [fp, #-16]
	ldr r5, =20
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L51
	b .L52
.L56:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L63
.L57:
	ldr r4, [fp, #-12]
	sub r5, r4, #2
	str r5, [fp, #-12]
	b .L53
.L58:
	ldr r4, [fp, #-12]
	ldr r5, =10
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L56
	b .L57
.L61:
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	str r5, [fp, #-8]
	b .L68
.L62:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L58
.L63:
	ldr r4, [fp, #-8]
	ldr r5, =7
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L61
	b .L62
.L66:
	ldr r4, [fp, #-4]
	add r5, r4, #3
	str r5, [fp, #-4]
	b .L68
.L67:
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L63
.L68:
	ldr r4, [fp, #-4]
	ldr r5, =20
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L66
	b .L67

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	mov fp, sp
	sub sp, sp, #0
.L83:
	bl FourWhile
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

