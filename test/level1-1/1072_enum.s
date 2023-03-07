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
	push {r7}
	mov fp, sp
	sub sp, sp, #16
.L46:
	ldr r4, =0
	str r4, [fp, #-16]
	ldr r4, =0
	str r4, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	b .L53
.L51:
	b .L56
.L52:
	mov r0, #0
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
	ldr r5, =21
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L51
	b .L52
.L54:
	ldr r4, [fp, #-16]
	ldr r5, =100
	sub r6, r5, r4
	ldr r4, [fp, #-12]
	sub r5, r6, r4
	str r5, [fp, #-8]
	ldr r4, [fp, #-16]
	ldr r5, =5
	mul r6, r5, r4
	ldr r4, [fp, #-12]
	ldr r5, =1
	mul r7, r5, r4
	add r4, r6, r7
	ldr r5, [fp, #-8]
	ldr r6, =2
	sdiv r7, r5, r6
	add r5, r4, r7
	ldr r4, =100
	cmp r5, r4
	mov r4, #0
	moveq r4, #1
	beq .L63
	b .L64
.L55:
	ldr r4, [fp, #-16]
	add r5, r4, #1
	str r5, [fp, #-16]
	b .L53
.L56:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	ldr r6, =101
	sub r7, r6, r5
	cmp r4, r7
	mov r4, #0
	movlt r4, #1
	blt .L54
	b .L55
.L63:
	ldr r4, [fp, #-16]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-12]
	mov r0, r4
	bl putint
	ldr r4, [fp, #-8]
	mov r0, r4
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	b .L64
.L64:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L56

