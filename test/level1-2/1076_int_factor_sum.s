	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global N
	.align 4
	.size N, 4
N:
	.word 0
	.global newline
	.align 4
	.size newline, 4
newline:
	.word 0
	.text
	.global factor
	.type factor , %function
factor:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #12
.L32:
	str r0, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, =1
	str r4, [fp, #-8]
	b .L38
.L36:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	sdiv r6, r4, r5
	mul r6, r6, r5
	sub r5, r4, r6
	ldr r4, =0
	cmp r5, r4
	mov r4, #0
	moveq r4, #1
	beq .L41
	b .L42
.L37:
	ldr r4, [fp, #-4]
	mov r0, r4
	add sp, sp, #12
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L38:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-12]
	add r6, r5, #1
	cmp r4, r6
	mov r4, #0
	movlt r4, #1
	blt .L36
	b .L37
.L41:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	add r6, r4, r5
	str r6, [fp, #-4]
	b .L42
.L42:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L38

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #12
.L49:
	ldr r4, =4
	ldr r5, addr_N0
	str r4, [r5]
	ldr r4, =10
	ldr r5, addr_newline0
	str r4, [r5]
	ldr r4, =1478
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	mov r0, r4
	bl factor
	mov r4, r0
	mov r0, r4
	add sp, sp, #12
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

addr_N0:
	.word N
addr_newline0:
	.word newline
