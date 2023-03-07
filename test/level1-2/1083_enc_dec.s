	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global enc
	.type enc , %function
enc:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #4
.L38:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =25
	cmp r4, r5
	mov r4, #0
	movgt r4, #1
	bgt .L40
	b .L41
.L40:
	ldr r4, [fp, #-4]
	add r5, r4, #60
	str r5, [fp, #-4]
	b .L42
.L41:
	ldr r4, [fp, #-4]
	sub r5, r4, #15
	str r5, [fp, #-4]
	b .L42
.L42:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

	.global dec
	.type dec , %function
dec:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #4
.L47:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =85
	cmp r4, r5
	mov r4, #0
	movgt r4, #1
	bgt .L49
	b .L50
.L49:
	ldr r4, [fp, #-4]
	sub r5, r4, #59
	str r5, [fp, #-4]
	b .L51
.L50:
	ldr r4, [fp, #-4]
	add r5, r4, #14
	str r5, [fp, #-4]
	b .L51
.L51:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #4
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	mov fp, sp
	sub sp, sp, #8
.L56:
	ldr r4, =400
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl enc
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl dec
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putint
	ldr r4, =10
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	mov r0, r4
	bl putch
	mov r0, #0
	add sp, sp, #8
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

