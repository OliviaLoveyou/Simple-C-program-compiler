	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a
	.align 4
	.size a, 4
a:
	.word 0
	.global b
	.align 4
	.size b, 4
b:
	.word 0
	.global d
	.align 4
	.size d, 4
d:
	.word 0
	.text
	.global set_a
	.type set_a , %function
set_a:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #4
.L185:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

	.global set_b
	.type set_b , %function
set_b:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #4
.L187:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_b0
	str r4, [r5]
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

	.global set_d
	.type set_d , %function
set_d:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	mov fp, sp
	sub sp, sp, #4
.L189:
	str r0, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, addr_d0
	str r4, [r5]
	ldr r4, addr_d0
	ldr r5, [r4]
	mov r0, r5
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
	push {r5}
	push {r6}
	push {r7}
	mov fp, sp
	sub sp, sp, #24
.L191:
	ldr r4, =2
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_b0
	str r4, [r5]
	ldr r0, =0
	bl set_a
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L194
	b .L193
.L192:
	b .L193
.L193:
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r0, =32
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r0, =32
	bl putch
	ldr r4, =2
	ldr r5, addr_a0
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_b0
	str r4, [r5]
	ldr r0, =0
	bl set_a
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L197
	b .L196
.L194:
	ldr r0, =1
	bl set_b
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L192
	b .L193
.L195:
	b .L196
.L196:
	ldr r4, addr_a0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r0, =32
	bl putch
	ldr r4, addr_b0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r0, =10
	bl putch
	ldr r4, =1
	str r4, [fp, #-24]
	ldr r4, =2
	ldr r5, addr_d0
	str r4, [r5]
	ldr r4, [fp, #-24]
	ldr r5, =1
	cmp r4, r5
	mov r4, #0
	movge r4, #1
	bge .L201
	b .L200
.L197:
	ldr r0, =1
	bl set_b
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L195
	b .L196
.L199:
	b .L200
.L200:
	ldr r4, addr_d0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r0, =32
	bl putch
	ldr r4, [fp, #-24]
	ldr r5, =1
	cmp r4, r5
	mov r4, #0
	movle r4, #1
	ble .L202
	b .L204
.L201:
	ldr r0, =3
	bl set_d
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L199
	b .L200
.L202:
	b .L203
.L203:
	ldr r4, addr_d0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r0, =10
	bl putch
	ldr r4, =2
	add r5, r4, #1
	ldr r4, =3
	sub r6, r4, r5
	ldr r4, =16
	cmp r4, r6
	mov r4, #0
	movge r4, #1
	bge .L205
	b .L206
.L204:
	ldr r0, =4
	bl set_d
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L202
	b .L203
.L205:
	ldr r0, =65
	bl putch
	b .L206
.L206:
	ldr r4, =25
	sub r5, r4, #7
	ldr r4, =6
	ldr r6, =3
	mul r7, r4, r6
	ldr r4, =36
	sub r6, r4, r7
	cmp r5, r6
	mov r4, #0
	movne r4, #1
	bne .L211
	b .L212
.L211:
	ldr r0, =66
	bl putch
	b .L212
.L212:
	ldr r4, =1
	ldr r5, =8
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	mov r5, r4
	ldr r4, =7
	ldr r6, =2
	sdiv r7, r4, r6
	mul r7, r7, r6
	sub r6, r4, r7
	cmp r5, r6
	mov r4, #0
	movne r4, #1
	bne .L219
	b .L220
.L219:
	ldr r0, =67
	bl putch
	b .L220
.L220:
	ldr r4, =3
	ldr r5, =4
	cmp r4, r5
	mov r4, #0
	movgt r4, #1
	mov r5, r4
	ldr r4, =0
	cmp r5, r4
	mov r4, #0
	moveq r4, #1
	beq .L223
	b .L224
.L223:
	ldr r0, =68
	bl putch
	b .L224
.L224:
	ldr r4, =102
	ldr r5, =63
	cmp r4, r5
	mov r4, #0
	movle r4, #1
	mov r5, r4
	ldr r4, =1
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L225
	b .L226
.L225:
	ldr r0, =69
	bl putch
	b .L226
.L226:
	ldr r4, =5
	sub r5, r4, #6
	ldr r4, =0
	ldr r6, =0
	cmp r4, r6
	mov r4, #0
	movne r4, #1
	eor r6, r4, #1
	mov r4, r6
	ldr r6, =0
	sub r7, r6, r4
	cmp r5, r7
	mov r4, #0
	moveq r4, #1
	beq .L227
	b .L228
.L227:
	ldr r0, =70
	bl putch
	b .L228
.L228:
	ldr r0, =10
	bl putch
	ldr r4, =0
	str r4, [fp, #-20]
	ldr r4, =1
	str r4, [fp, #-16]
	ldr r4, =2
	str r4, [fp, #-12]
	ldr r4, =3
	str r4, [fp, #-8]
	ldr r4, =4
	str r4, [fp, #-4]
	b .L240
.L238:
	ldr r0, =32
	bl putch
	b .L240
.L239:
	ldr r4, [fp, #-20]
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L242
	b .L244
.L240:
	ldr r4, [fp, #-20]
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L241
	b .L239
.L241:
	ldr r4, [fp, #-16]
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L238
	b .L239
.L242:
	ldr r0, =67
	bl putch
	b .L243
.L243:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	cmp r4, r5
	mov r4, #0
	movge r4, #1
	bge .L245
	b .L247
.L244:
	ldr r4, [fp, #-16]
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L242
	b .L243
.L245:
	ldr r0, =72
	bl putch
	b .L246
.L246:
	ldr r4, [fp, #-12]
	ldr r5, [fp, #-16]
	cmp r4, r5
	mov r4, #0
	movge r4, #1
	bge .L250
	b .L249
.L247:
	ldr r4, [fp, #-16]
	ldr r5, [fp, #-20]
	cmp r4, r5
	mov r4, #0
	movle r4, #1
	ble .L245
	b .L246
.L248:
	ldr r0, =73
	bl putch
	b .L249
.L249:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	ldr r6, =0
	cmp r5, r6
	mov r5, #0
	movne r5, #1
	eor r6, r5, #1
	mov r5, r6
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L254
	b .L253
.L250:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-8]
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L248
	b .L249
.L251:
	ldr r0, =74
	bl putch
	b .L252
.L252:
	ldr r4, [fp, #-20]
	ldr r5, [fp, #-16]
	ldr r6, =0
	cmp r5, r6
	mov r5, #0
	movne r5, #1
	eor r6, r5, #1
	mov r5, r6
	cmp r4, r5
	mov r4, #0
	moveq r4, #1
	beq .L256
	b .L258
.L253:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	cmp r4, r5
	mov r4, #0
	movge r4, #1
	bge .L251
	b .L252
.L254:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L251
	b .L253
.L256:
	ldr r0, =75
	bl putch
	b .L257
.L257:
	ldr r0, =10
	bl putch
	mov r0, #0
	add sp, sp, #24
	pop {r7}
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L258:
	ldr r4, [fp, #-8]
	ldr r5, [fp, #-8]
	cmp r4, r5
	mov r4, #0
	movlt r4, #1
	blt .L260
	b .L257
.L260:
	ldr r4, [fp, #-4]
	ldr r5, [fp, #-4]
	cmp r4, r5
	mov r4, #0
	movge r4, #1
	bge .L256
	b .L257

addr_a0:
	.word a
addr_b0:
	.word b
addr_d0:
	.word d
