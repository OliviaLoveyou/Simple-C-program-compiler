	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global func
	.type func , %function
func:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #4
.L36:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =50
	cmp r4, r5
	mov r4, #0
	movle r4, #1
	ble .L38
	b .L39
.L38:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #1
	add sp, sp, #4
	bx lr
	b .L40
.L39:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #4
	bx lr
	b .L40
.L40:

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #4
.L41:
	ldr r0, =0
	bl func
	mov r4, r0
	ldr r5, =1
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L43
	b .L46
.L43:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L45
.L44:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L45
.L45:
	ldr r0, =50
	bl func
	mov r4, r0
	ldr r5, =1
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L52
	b .L51
.L46:
	ldr r0, =50
	bl func
	mov r4, r0
	ldr r5, =1
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L47
	b .L44
.L47:
	ldr r0, =100
	bl func
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L43
	b .L44
.L48:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L50
.L49:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L50
.L50:
	mov r0, #0
	add sp, sp, #4
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L51:
	ldr r0, =1
	bl func
	mov r4, r0
	ldr r5, =1
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L48
	b .L49
.L52:
	ldr r0, =40
	bl func
	mov r4, r0
	ldr r5, =1
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L48
	b .L51

