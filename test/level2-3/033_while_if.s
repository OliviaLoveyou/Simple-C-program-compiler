	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global get_one
	.type get_one , %function
get_one:
	push {lr}
	push {fp}
	mov fp, sp
	sub sp, sp, #4
.L41:
	str r0, [fp, #-4]
	mov r0, #1
	add sp, sp, #4
	pop {fp}
	pop {lr}
	bx lr

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
.L43:
	str r0, [fp, #-20]
	str r1, [fp, #-16]
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	add r6, r4, r5
	str r6, [fp, #-12]
	b .L51
.L49:
	ldr r4, =42
	str r4, [fp, #-8]
	ldr r4, [fp, #-12]
	ldr r5, =100
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L53
	b .L54
.L50:
	ldr r4, [fp, #-12]
	mov r0, r4
	add sp, sp, #20
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L51:
	ldr r4, [fp, #-12]
	ldr r5, =75
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L49
	b .L50
.L53:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	str r6, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, =99
	cmp r4, r5
	mov r4, #0
	movgt r4, #1
	bgt .L57
	b .L58
.L54:
	b .L51
.L57:
	ldr r4, [fp, #-8]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-4]
	ldr r0, =0
	bl get_one
	mov r4, r0
	ldr r5, =1
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L62
	b .L63
.L58:
	b .L54
.L62:
	ldr r4, [fp, #-4]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-12]
	b .L63
.L63:
	b .L58

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #4
.L66:
	ldr r4, =2
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl deepWhileBr
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #4
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

