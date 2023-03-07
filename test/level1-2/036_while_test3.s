	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global g
	.align 4
	.size g, 4
g:
	.word 0
	.global h
	.align 4
	.size h, 4
h:
	.word 0
	.global f
	.align 4
	.size f, 4
f:
	.word 0
	.global e
	.align 4
	.size e, 4
e:
	.word 0
	.text
	.global EightWhile
	.type EightWhile , %function
EightWhile:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	push {r7}
	mov fp, sp
	sub sp, sp, #16
.L94:
	ldr r4, =5
	str r4, [fp, #-16]
	ldr r4, =6
	str r4, [fp, #-12]
	ldr r4, =7
	str r4, [fp, #-8]
	ldr r4, =10
	str r4, [fp, #-4]
	b .L101
.L99:
	ldr r4, [fp, #-16]
	add r5, r4, #3
	str r5, [fp, #-16]
	b .L106
.L100:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-12]
	ldr r6, [fp, #-4]
	add r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-8]
	add r6, r5, r4
	ldr r4, addr_e0
	ldr r5, [r4]
	ldr r4, [fp, #-4]
	add r7, r5, r4
	ldr r4, addr_g0
	ldr r5, [r4]
	sub r4, r7, r5
	ldr r5, addr_h0
	ldr r7, [r5]
	add r5, r4, r7
	sub r4, r6, r5
	mov r0, r4
	add sp, sp, #16
	pop {r7}
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L101:
	ldr r4, [fp, #-16]
	ldr r5, =20
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L99
	b .L100
.L104:
	ldr r4, [fp, #-12]
	add r5, r4, #1
	str r5, [fp, #-12]
	b .L111
.L105:
	ldr r4, [fp, #-12]
	sub r5, r4, #2
	str r5, [fp, #-12]
	b .L101
.L106:
	ldr r4, [fp, #-12]
	ldr r5, =10
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L104
	b .L105
.L109:
	ldr r4, [fp, #-8]
	sub r5, r4, #1
	str r5, [fp, #-8]
	b .L116
.L110:
	ldr r4, [fp, #-8]
	add r5, r4, #1
	str r5, [fp, #-8]
	b .L106
.L111:
	ldr r4, [fp, #-8]
	ldr r5, =7
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L109
	b .L110
.L114:
	ldr r4, [fp, #-4]
	add r5, r4, #3
	str r5, [fp, #-4]
	b .L121
.L115:
	ldr r4, [fp, #-4]
	sub r5, r4, #1
	str r5, [fp, #-4]
	b .L111
.L116:
	ldr r4, [fp, #-4]
	ldr r5, =20
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L114
	b .L115
.L119:
	ldr r4, addr_e0
	ldr r5, [r4]
	sub r4, r5, #1
	ldr r5, addr_e0
	str r4, [r5]
	b .L126
.L120:
	ldr r4, addr_e0
	ldr r5, [r4]
	add r4, r5, #1
	ldr r5, addr_e0
	str r4, [r5]
	b .L116
.L121:
	ldr r4, addr_e0
	ldr r5, [r4]
	ldr r4, =1
	cmp r5, r4
	mov r4, #0
	movgt r4, #1
	bgt .L119
	b .L120
.L124:
	ldr r4, addr_f0
	ldr r5, [r4]
	sub r4, r5, #2
	ldr r5, addr_f0
	str r4, [r5]
	b .L131
.L125:
	ldr r4, addr_f0
	ldr r5, [r4]
	add r4, r5, #1
	ldr r5, addr_f0
	str r4, [r5]
	b .L121
.L126:
	ldr r4, addr_f0
	ldr r5, [r4]
	ldr r4, =2
	cmp r5, r4
	mov r4, #0
	movgt r4, #1
	bgt .L124
	b .L125
.L129:
	ldr r4, addr_g0
	ldr r5, [r4]
	add r4, r5, #10
	ldr r5, addr_g0
	str r4, [r5]
	b .L136
.L130:
	ldr r4, addr_g0
	ldr r5, [r4]
	sub r4, r5, #8
	ldr r5, addr_g0
	str r4, [r5]
	b .L126
.L131:
	ldr r4, addr_g0
	ldr r5, [r4]
	ldr r4, =3
	cmp r5, r4
	mov r4, #0
	movlt r4, #1
	blt .L129
	b .L130
.L134:
	ldr r4, addr_h0
	ldr r5, [r4]
	add r4, r5, #8
	ldr r5, addr_h0
	str r4, [r5]
	b .L136
.L135:
	ldr r4, addr_h0
	ldr r5, [r4]
	sub r4, r5, #1
	ldr r5, addr_h0
	str r4, [r5]
	b .L131
.L136:
	ldr r4, addr_h0
	ldr r5, [r4]
	ldr r4, =10
	cmp r5, r4
	mov r4, #0
	movlt r4, #1
	blt .L134
	b .L135

	.global main
	.type main , %function
main:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #0
.L167:
	ldr r4, =1
	ldr r5, addr_g0
	str r4, [r5]
	ldr r4, =2
	ldr r5, addr_h0
	str r4, [r5]
	ldr r4, =4
	ldr r5, addr_e0
	str r4, [r5]
	ldr r4, =6
	ldr r5, addr_f0
	str r4, [r5]
	bl EightWhile
	mov r4, r0
	mov r0, r4
	add sp, sp, #0
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

addr_g0:
	.word g
addr_h0:
	.word h
addr_f0:
	.word f
addr_e0:
	.word e
