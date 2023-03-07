	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global s
	.align 4
	.size s, 4
s:
	.word 0
	.text
	.global get_ans_se
	.type get_ans_se , %function
get_ans_se:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #16
.L211:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L216
	b .L217
.L216:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L217
.L217:
	ldr r4, [fp, #-16]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, addr_s0
	ldr r5, [r4]
	ldr r4, [fp, #-16]
	add r6, r5, r4
	ldr r4, addr_s0
	str r6, [r4]
	ldr r4, [fp, #-16]
	mov r0, r4
	add sp, sp, #16
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

	.global get_ans
	.type get_ans , %function
get_ans:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #16
.L224:
	str r0, [fp, #-16]
	str r1, [fp, #-12]
	str r2, [fp, #-8]
	ldr r4, =0
	str r4, [fp, #-4]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-8]
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L229
	b .L230
.L229:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L230
.L230:
	ldr r4, [fp, #-16]
	ldr r5, =2
	mul r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-4]
	add r6, r4, r5
	str r6, [fp, #-16]
	ldr r4, [fp, #-16]
	mov r0, r4
	add sp, sp, #16
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
	push {r7}
	push {r8}
	mov fp, sp
	sub sp, sp, #36
.L235:
	ldr r4, =0
	sub r5, r4, #-2147483648
	str r5, [fp, #-36]
	ldr r4, =-2147483648
	str r4, [fp, #-32]
	ldr r4, =-2147483648
	add r5, r4, #1
	str r5, [fp, #-28]
	ldr r4, =2147483647
	str r4, [fp, #-24]
	ldr r4, =2147483647
	sub r5, r4, #1
	str r5, [fp, #-20]
	ldr r4, [fp, #-36]
	ldr r5, [fp, #-32]
	ldr r0, =0
	mov r1, r4
	mov r2, r5
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-36]
	add r6, r5, #1
	ldr r5, [fp, #-28]
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-36]
	ldr r6, [fp, #-24]
	ldr r7, =0
	sub r8, r7, r6
	sub r6, r8, #1
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-36]
	ldr r6, [fp, #-20]
	add r7, r6, #1
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-32]
	ldr r6, =2
	sdiv r7, r5, r6
	ldr r5, [fp, #-28]
	ldr r6, =2
	sdiv r8, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, r8
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-24]
	ldr r7, =0
	sub r8, r7, r6
	sub r6, r8, #1
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-20]
	add r7, r6, #1
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans
	mov r4, r0
	str r4, [fp, #-16]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	ldr r0, =0
	mov r1, r4
	mov r2, r5
	bl get_ans
	mov r4, r0
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans
	mov r4, r0
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans
	mov r4, r0
	str r4, [fp, #-12]
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-36]
	ldr r6, =2
	sdiv r7, r5, r6
	ldr r5, [fp, #-32]
	ldr r6, =2
	sdiv r8, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, r8
	bl get_ans
	mov r4, r0
	str r4, [fp, #-12]
	ldr r4, [fp, #-36]
	ldr r5, [fp, #-32]
	ldr r0, =0
	mov r1, r4
	mov r2, r5
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-36]
	add r6, r5, #1
	ldr r5, [fp, #-28]
	mov r0, r4
	mov r1, r6
	mov r2, r5
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-36]
	ldr r6, [fp, #-24]
	ldr r7, =0
	sub r8, r7, r6
	sub r6, r8, #1
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-36]
	ldr r6, [fp, #-20]
	add r7, r6, #1
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-32]
	ldr r6, =2
	sdiv r7, r5, r6
	ldr r5, [fp, #-28]
	ldr r6, =2
	sdiv r8, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, r8
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-24]
	ldr r7, =0
	sub r8, r7, r6
	sub r6, r8, #1
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-32]
	ldr r6, [fp, #-20]
	add r7, r6, #1
	mov r0, r4
	mov r1, r5
	mov r2, r7
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-8]
	ldr r4, [fp, #-28]
	ldr r5, [fp, #-24]
	ldr r0, =0
	mov r1, r4
	mov r2, r5
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-28]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-24]
	ldr r6, [fp, #-20]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-36]
	ldr r6, =2
	sdiv r7, r5, r6
	ldr r5, [fp, #-32]
	ldr r6, =2
	sdiv r8, r5, r6
	mov r0, r4
	mov r1, r7
	mov r2, r8
	bl get_ans_se
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	add r6, r4, r5
	ldr r4, [fp, #-8]
	add r5, r6, r4
	ldr r4, [fp, #-4]
	add r6, r5, r4
	mov r0, r6
	add sp, sp, #36
	pop {r8}
	pop {r7}
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

addr_s0:
	.word s
