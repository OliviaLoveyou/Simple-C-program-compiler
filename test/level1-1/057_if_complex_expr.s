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
	sub sp, sp, #20
.L47:
	ldr r4, =5
	str r4, [fp, #-20]
	ldr r4, =5
	str r4, [fp, #-16]
	ldr r4, =1
	str r4, [fp, #-12]
	ldr r4, =0
	sub r5, r4, #2
	str r5, [fp, #-8]
	ldr r4, =2
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =1
	mul r6, r4, r5
	ldr r4, =2
	sdiv r5, r6, r4
	ldr r4, =0
	cmp r5, r4
	mov r4, #0
	movlt r4, #1
	blt .L54
	b .L56
.L54:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L55
.L55:
	ldr r4, [fp, #-8]
	ldr r5, =2
	sdiv r6, r4, r5
	mul r6, r6, r5
	sub r5, r4, r6
	add r4, r5, #67
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L68
	b .L70
.L56:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	sub r6, r4, r5
	ldr r4, =0
	cmp r6, r4
	mov r4, #0
	movne r4, #1
	bne .L61
	b .L55
.L61:
	ldr r4, [fp, #-12]
	add r5, r4, #3
	ldr r4, =2
	sdiv r6, r5, r4
	mul r6, r6, r4
	sub r4, r5, r6
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L54
	b .L55
.L68:
	ldr r4, =4
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	b .L69
.L69:
	mov r0, #0
	add sp, sp, #20
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L70:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	sub r6, r4, r5
	ldr r4, =0
	cmp r6, r4
	mov r4, #0
	movne r4, #1
	bne .L75
	b .L69
.L75:
	ldr r4, [fp, #-12]
	add r5, r4, #2
	ldr r4, =2
	sdiv r6, r5, r4
	mul r6, r6, r4
	sub r4, r5, r6
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L68
	b .L69

