	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global gcd
	.type gcd , %function
gcd:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	push {r7}
	mov fp, sp
	sub sp, sp, #8
.L33:
	str r0, [fp, #-8]
	str r1, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L36
	b .L37
.L36:
	ldr r4, [fp, #-8]
	mov r0, r4
	add sp, sp, #8
	bx lr
	b .L37
.L37:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	ldr r6, [fp, #-4]
	sdiv r7, r5, r6
	mul r7, r7, r6
	sub r6, r5, r7
	mov r0, r4
	mov r1, r6
	bl gcd
	mov r4, r0
	mov r0, r4
	add sp, sp, #8
	pop {r7}
	pop {r6}
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
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #12
.L40:
	mov r0, v5
	mov r1, v8
	bl getint
	mov r4, r0
	str r4, [fp, #-12]
	b .L44
.L42:
	mov r0, v5
	mov r1, v8
	bl getint
	mov r4, r0
	str r4, [fp, #-8]
	mov r0, v5
	mov r1, v8
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-4]
	mov r0, r4
	mov r1, r5
	bl gcd
	mov r6, r0
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl putint
	ldr r0, =10
	bl putch
	ldr r4, [fp, #-12]
	sub r5, r4, #1
	str r5, [fp, #-12]
	b .L44
.L43:
	mov r0, #0
	add sp, sp, #12
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L44:
	ldr r4, [fp, #-12]
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movgt r4, #1
	bgt .L42
	b .L43

