	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global ifWhile
	.type ifWhile , %function
ifWhile:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #8
.L25:
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =3
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =5
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L28
	b .L29
.L28:
	b .L33
.L29:
	b .L40
.L30:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #8
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L31:
	ldr r4, [fp, #-4]
	add r5, r4, #2
	str r5, [fp, #-4]
	b .L33
.L32:
	ldr r4, [fp, #-4]
	add r5, r4, #25
	str r5, [fp, #-4]
	b .L30
.L33:
	ldr r4, [fp, #-4]
	ldr r5, =2
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L31
	b .L32
.L38:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L40
.L39:
	b .L30
.L40:
	ldr r4, [fp, #-8]
	ldr r5, =5
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L38
	b .L39

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	mov fp, sp
	sub sp, sp, #0
.L45:
	bl ifWhile
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

