	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global k
	.align 4
	.size k, 4
k:
	.word 0
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
	sub sp, sp, #16
.L33:
	ldr r4, =3389
	ldr r5, addr_k0
	str r4, [r5]
	ldr r4, addr_k0
	ldr r5, [r4]
	ldr r4, =10000
	cmp r5, r4
	mov r4, #0
	movlt r4, #1
	blt .L34
	b .L35
.L34:
	ldr r4, addr_k0
	ldr r5, [r4]
	add r4, r5, #1
	ldr r5, addr_k0
	str r4, [r5]
	ldr r4, =112
	str r4, [fp, #-16]
	b .L41
.L35:
	ldr r4, addr_k0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #16
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L39:
	ldr r4, [fp, #-16]
	sub r5, r4, #88
	str r5, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, =1000
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L44
	b .L45
.L40:
	ldr r4, [fp, #-16]
	mov r0, r4
	bl putint
	b .L35
.L41:
	ldr r4, [fp, #-16]
	ldr r5, =10
	cmp r4, r5
	mov r4, #0
	movgt r4, #1
	bgt .L39
	b .L40
.L44:
	ldr r4, =9
	str r4, [fp, #-12]
	ldr r4, =11
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-12]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	sub r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, =11
	str r4, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	ldr r4, [fp, #-8]
	add r5, r6, r4
	str r5, [fp, #-16]
	b .L45
.L45:
	b .L41

addr_k0:
	.word k
