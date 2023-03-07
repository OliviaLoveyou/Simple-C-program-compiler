	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global move
	.type move , %function
move:
	push {lr}
	push {fp}
	push {r4}
	mov fp, sp
	sub sp, sp, #8
.L56:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r0, =32
	bl putch
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r0, =44
	bl putch
	ldr r0, =32
	bl putch

	.global hanoi
	.type hanoi , %function
hanoi:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	push {r7}
	mov fp, sp
	sub sp, sp, #16
.L59:
	str r2, [fp, #-16]
	str r3, [fp, #-12]
	str r4, [fp, #-8]
	str r5, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, =1
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L64
	b .L65
.L64:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl move
	b .L66
.L65:
	ldr r4, [fp, #-16]
	sub r5, r4, #1
	ldr r4, [fp, #-12]
	ldr r6, [fp, #-4]
	ldr r7, [fp, #-8]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	mov r3, r7
	bl hanoi
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl move
	ldr r4, [fp, #-16]
	sub r5, r4, #1
	ldr r4, [fp, #-8]
	ldr r6, [fp, #-12]
	ldr r7, [fp, #-4]
	mov r0, r5
	mov r1, r4
	mov r2, r6
	mov r3, r7
	bl hanoi
	b .L66
.L66:

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #4
.L71:
	mov r0, v28
	mov r1, v29
	mov r2, v30
	mov r3, v31
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	b .L75
.L73:
	bl getint
	mov r4, r0
	mov r0, r4
	ldr r1, =1
	ldr r2, =2
	ldr r3, =3
	bl hanoi
	ldr r0, =10
	bl putch
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L75
.L74:
	mov r0, #0
	add sp, sp, #4
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L75:
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movgt r4, #1
	bgt .L73
	b .L74

