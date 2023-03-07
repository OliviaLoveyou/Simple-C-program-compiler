	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global deepWhileBr
	.type deepWhileBr , %function
deepWhileBr:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #20
.L34:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	add r6, r4, r5
	str r6, [fp, #-12]
	b .L42
.L40:
	ldr r4, =42
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	ldr r5, =100
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L44
	b .L45
.L41:
	ldr r4, [fp, #-12]
	mov r0, r4
	add sp, sp, #20
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L42:
	ldr r4, [fp, #-12]
	ldr r5, =75
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L40
	b .L41
.L44:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	str r6, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, =99
	cmp r4, r5
	mov r4, #0
	movgt r4, #1
	bgt .L48
	b .L49
.L45:
	b .L42
.L48:
	ldr r4, [fp, #-8]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-4]
	ldr r4, =1
	ldr r5, =1
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L53
	b .L54
.L49:
	b .L45
.L53:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-12]
	b .L54
.L54:
	b .L49

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #4
.L57:
	ldr r4, =2
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl deepWhileBr
	mov r4, r0
	mov r0, r4
	add sp, sp, #4
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

