	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global ifElseIf
	.type ifElseIf , %function
ifElseIf:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #8
.L37:
	ldr r4, =5
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, =6
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L40
	b .L43
.L40:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	bx lr
	b .L42
.L41:
	ldr r4, [fp, #-4]
	ldr r5, =10
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L47
	b .L45
.L42:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L43:
	ldr r4, [fp, #-4]
	ldr r5, =11
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L40
	b .L41
.L44:
	ldr r4, =25
	str r4, [fp, #-8]
	b .L46
.L45:
	ldr r4, [fp, #-4]
	ldr r5, =10
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L51
	b .L49
.L46:
	b .L42
.L47:
	ldr r4, [fp, #-8]
	ldr r5, =1
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L44
	b .L45
.L48:
	ldr r4, [fp, #-8]
	add r5, r4, #15
	str r5, [fp, #-8]
	b .L50
.L49:
	ldr r4, [fp, #-8]
	ldr r5, =0
	add r6, r5, r4
	ldr r4, =0
	sub r5, r4, r6
	str r5, [fp, #-8]
	b .L50
.L50:
	b .L46
.L51:
	ldr r4, [fp, #-8]
	ldr r5, =0
	sub r6, r5, #5
	cmp r4, r6
	mov r4, #0
	moveq r4, #1
	beq .L48
	b .L49

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	mov fp, sp
	sub sp, sp, #0
.L57:
	bl ifElseIf
	mov r4, r0
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #0
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

