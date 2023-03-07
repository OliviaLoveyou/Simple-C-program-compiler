	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 7
	.text
	.global func
	.type func , %function
func:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #8
.L29:
	ldr r4, addr_a0
	ldr r5, [r4]
	str r5, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L32
	b .L33
.L32:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	mov r0, #1
	add sp, sp, #8
	bx lr
	b .L34
.L33:
	mov r0, #0
	add sp, sp, #8
	bx lr
	b .L34
.L34:

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #8
.L37:
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	b .L42
.L40:
	bl func
	mov r4, r0
	ldr r5, =1
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L43
	b .L44
.L41:
	ldr r4, [fp, #-8]
	ldr r5, =100
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L49
	b .L50
.L42:
	ldr r4, [fp, #-4]
	ldr r5, =100
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L40
	b .L41
.L43:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L44
.L44:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	b .L42
.L49:
	ldr r0, =1
	bl putint
	b .L51
.L50:
	ldr r0, =0
	bl putint
	b .L51
.L51:
	mov r0, #0
	add sp, sp, #8
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

addr_a0:
	.word a
