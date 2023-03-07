	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global k
	.align 4
	.size k, 4
k:
	.word 0
	.global n
	.align 4
	.size n, 4
n:
	.word 10
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
	sub sp, sp, #4
.L21:
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, =1
	ldr r5, addr_k0
	str r4, [r5]
	b .L25
.L23:
	ldr r4, [fp, #-4]
	add r5, r4, #1
	str r5, [fp, #-4]
	ldr r4, addr_k0
	ldr r5, [r4]
	add r4, r5, #1
	ldr r4, addr_k0
	ldr r5, [r4]
	ldr r4, addr_k0
	ldr r6, [r4]
	add r4, r5, r6
	ldr r5, addr_k0
	str r4, [r5]
	b .L25
.L24:
	ldr r4, addr_k0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r4, addr_k0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L25:
	ldr r4, [fp, #-4]
	ldr r5, addr_n0
	ldr r6, [r5]
	sub r5, r6, #1
	cmp r4, r5
	mov r4, #0
	movle r4, #1
	ble .L23
	b .L24

addr_k0:
	.word k
addr_n0:
	.word n
