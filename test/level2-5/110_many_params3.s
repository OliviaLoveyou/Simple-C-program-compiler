	.arch armv8-a
	.arch_extension crc
	.arm
	.text
	.global testParam8
	.type testParam8 , %function
testParam8:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #32
.L293:
	str r0, [fp, #-32]
	str r1, [fp, #-28]
	str r2, [fp, #-24]
	str r3, [fp, #-20]
	str r4, [fp, #-16]
	str r5, [fp, #-12]
	str r6, [fp, #-8]
	str r7, [fp, #-4]
	ldr r4, [fp, #-32]
	ldr r5, [fp, #-28]
	sub r6, r4, r5
	ldr r4, [fp, #-24]
	add r5, r6, r4
	ldr r4, [fp, #-20]
	sub r6, r5, r4
	ldr r4, [fp, #-16]
	sub r5, r6, r4
	ldr r4, [fp, #-12]
	sub r6, r5, r4
	ldr r4, [fp, #-8]
	add r5, r6, r4
	ldr r4, [fp, #-4]
	add r6, r5, r4
	mov r0, r6
	add sp, sp, #32
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

	.global testParam16
	.type testParam16 , %function
testParam16:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #64
.L316:
	str r0, [fp, #-64]
	str r1, [fp, #-60]
	str r2, [fp, #-56]
	str r3, [fp, #-52]
	str r4, [fp, #-48]
	str r5, [fp, #-44]
	str r6, [fp, #-40]
	str r7, [fp, #-36]
	str r8, [fp, #-32]
	str r9, [fp, #-28]
	str r10, [fp, #-24]
	str fp, [fp, #-20]
	str r12, [fp, #-16]
	str sp, [fp, #-12]
	str lr, [fp, #-8]
	str pc, [fp, #-4]
	ldr r4, [fp, #-64]
	ldr r5, [fp, #-60]
	add r6, r4, r5
	ldr r4, [fp, #-56]
	add r5, r6, r4
	ldr r4, [fp, #-52]
	add r6, r5, r4
	ldr r4, [fp, #-48]
	sub r5, r6, r4
	ldr r4, [fp, #-44]
	add r6, r5, r4
	ldr r4, [fp, #-40]
	add r5, r6, r4
	ldr r4, [fp, #-36]
	add r6, r5, r4
	ldr r4, [fp, #-32]
	sub r5, r6, r4
	ldr r4, [fp, #-28]
	add r6, r5, r4
	ldr r4, [fp, #-24]
	sub r5, r6, r4
	ldr r4, [fp, #-20]
	add r6, r5, r4
	ldr r4, [fp, #-16]
	add r5, r6, r4
	ldr r4, [fp, #-12]
	add r6, r5, r4
	ldr r4, [fp, #-8]
	add r5, r6, r4
	ldr r4, [fp, #-4]
	add r6, r5, r4
	mov r0, r6
	add sp, sp, #64
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

	.global testParam32
	.type testParam32 , %function
testParam32:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	push {r7}
	mov fp, sp
	sub sp, sp, #128
.L363:
	str r0, [fp, #-128]
	str r1, [fp, #-124]
	str r2, [fp, #-120]
	str r3, [fp, #-116]
	str r4, [fp, #-112]
	str r5, [fp, #-108]
	str r6, [fp, #-104]
	str r7, [fp, #-100]
	str r8, [fp, #-96]
	str r9, [fp, #-92]
	str r10, [fp, #-88]
	str fp, [fp, #-84]
	str r12, [fp, #-80]
	str sp, [fp, #-76]
	str lr, [fp, #-72]
	str pc, [fp, #-68]
	str r16, [fp, #-64]
	str r17, [fp, #-60]
	str r18, [fp, #-56]
	str r19, [fp, #-52]
	str r20, [fp, #-48]
	str r21, [fp, #-44]
	str r22, [fp, #-40]
	str r23, [fp, #-36]
	str r24, [fp, #-32]
	str r25, [fp, #-28]
	str r26, [fp, #-24]
	str r27, [fp, #-20]
	str r28, [fp, #-16]
	str r29, [fp, #-12]
	str r30, [fp, #-8]
	str r31, [fp, #-4]
	ldr r4, [fp, #-128]
	ldr r5, [fp, #-124]
	ldr r6, [fp, #-120]
	mul r7, r5, r6
	add r5, r4, r7
	ldr r4, [fp, #-116]
	add r6, r5, r4
	ldr r4, [fp, #-112]
	add r5, r6, r4
	ldr r4, [fp, #-108]
	add r6, r5, r4
	ldr r4, [fp, #-104]
	add r5, r6, r4
	ldr r4, [fp, #-100]
	add r6, r5, r4
	ldr r4, [fp, #-96]
	add r5, r6, r4
	ldr r4, [fp, #-92]
	add r6, r5, r4
	ldr r4, [fp, #-88]
	add r5, r6, r4
	ldr r4, [fp, #-84]
	add r6, r5, r4
	ldr r4, [fp, #-80]
	sub r5, r6, r4
	ldr r4, [fp, #-76]
	sub r6, r5, r4
	ldr r4, [fp, #-72]
	sub r5, r6, r4
	ldr r4, [fp, #-68]
	sub r6, r5, r4
	ldr r4, [fp, #-64]
	sub r5, r6, r4
	ldr r4, [fp, #-60]
	sub r6, r5, r4
	ldr r4, [fp, #-56]
	sub r5, r6, r4
	ldr r4, [fp, #-52]
	sub r6, r5, r4
	ldr r4, [fp, #-48]
	sub r5, r6, r4
	ldr r4, [fp, #-44]
	sub r6, r5, r4
	ldr r4, [fp, #-40]
	add r5, r6, r4
	ldr r4, [fp, #-36]
	add r6, r5, r4
	ldr r4, [fp, #-32]
	add r5, r6, r4
	ldr r4, [fp, #-28]
	add r6, r5, r4
	ldr r4, [fp, #-24]
	add r5, r6, r4
	ldr r4, [fp, #-20]
	add r6, r5, r4
	ldr r4, [fp, #-16]
	add r5, r6, r4
	ldr r4, [fp, #-12]
	add r6, r5, r4
	ldr r4, [fp, #-8]
	add r5, r6, r4
	ldr r4, [fp, #-4]
	add r6, r5, r4
	mov r0, r6
	add sp, sp, #128
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
	push {r7}
	push {r8}
	push {r9}
	push {r10}
	mov fp, sp
	sub sp, sp, #332
.L458:
	ldr r4, =0
	str r4, [fp, #-128]
	ldr r4, =1
	str r4, [fp, #-124]
	ldr r4, =2
	str r4, [fp, #-120]
	ldr r4, =3
	str r4, [fp, #-116]
	ldr r4, =4
	str r4, [fp, #-112]
	ldr r4, =5
	str r4, [fp, #-108]
	ldr r4, =6
	str r4, [fp, #-104]
	ldr r4, =7
	str r4, [fp, #-100]
	ldr r4, =8
	str r4, [fp, #-96]
	ldr r4, =9
	str r4, [fp, #-92]
	ldr r4, =0
	str r4, [fp, #-88]
	ldr r4, =1
	str r4, [fp, #-84]
	ldr r4, =2
	str r4, [fp, #-80]
	ldr r4, =3
	str r4, [fp, #-76]
	ldr r4, =4
	str r4, [fp, #-72]
	ldr r4, =5
	str r4, [fp, #-68]
	ldr r4, =6
	str r4, [fp, #-64]
	ldr r4, =7
	str r4, [fp, #-60]
	ldr r4, =8
	str r4, [fp, #-56]
	ldr r4, =9
	str r4, [fp, #-52]
	ldr r4, =0
	str r4, [fp, #-48]
	ldr r4, =1
	str r4, [fp, #-44]
	ldr r4, =2
	str r4, [fp, #-40]
	ldr r4, =3
	str r4, [fp, #-36]
	ldr r4, =4
	str r4, [fp, #-32]
	ldr r4, =5
	str r4, [fp, #-28]
	ldr r4, =6
	str r4, [fp, #-24]
	ldr r4, =7
	str r4, [fp, #-20]
	ldr r4, =8
	str r4, [fp, #-16]
	ldr r4, =9
	str r4, [fp, #-12]
	ldr r4, =0
	str r4, [fp, #-8]
	ldr r4, =1
	str r4, [fp, #-4]
	ldr r4, [fp, #-128]
	ldr r5, [fp, #-124]
	ldr r6, [fp, #-120]
	ldr r7, [fp, #-116]
	ldr r8, [fp, #-112]
	ldr r9, [fp, #-108]
	ldr r10, =-332
	str r9, [fp, r10]
	ldr r9, [fp, #-104]
	ldr r10, =-328
	str r9, [fp, r10]
	ldr r9, [fp, #-100]
	ldr r10, =-132
	str r9, [fp, r10]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r7
	push {r8}
	ldr r9, =-332
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-328
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-132
	ldr r10, [fp, r9]
	push {r10}
	bl testParam8
	mov r9, r0
	ldr r10, =-136
	str r9, [fp, r10]
	ldr r9, [fp, #-124]
	ldr r10, =-140
	str r9, [fp, r10]
	ldr r9, [fp, #-120]
	ldr r10, =-144
	str r9, [fp, r10]
	ldr r9, [fp, #-116]
	ldr r10, =-148
	str r9, [fp, r10]
	ldr r9, [fp, #-112]
	ldr r10, =-152
	str r9, [fp, r10]
	ldr r9, [fp, #-108]
	ldr r10, =-156
	str r9, [fp, r10]
	ldr r9, [fp, #-104]
	ldr r10, =-160
	str r9, [fp, r10]
	ldr r9, [fp, #-100]
	ldr r10, =-164
	str r9, [fp, r10]
	ldr r9, [fp, #-96]
	ldr r10, =-168
	str r9, [fp, r10]
	ldr r9, [fp, #-92]
	ldr r10, =-172
	str r9, [fp, r10]
	ldr r9, [fp, #-88]
	ldr r10, =-176
	str r9, [fp, r10]
	ldr r9, [fp, #-84]
	ldr r10, =-180
	str r9, [fp, r10]
	ldr r9, [fp, #-80]
	ldr r10, =-184
	str r9, [fp, r10]
	ldr r9, [fp, #-76]
	ldr r10, =-188
	str r9, [fp, r10]
	ldr r9, [fp, #-72]
	ldr r10, =-192
	str r9, [fp, r10]
	ldr r9, [fp, #-68]
	ldr r10, =-196
	str r9, [fp, r10]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r7
	push {r8}
	ldr r9, =-332
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-328
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-132
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-136
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-140
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-144
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-148
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-152
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-156
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-160
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-164
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-168
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-172
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-176
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-180
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-184
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-188
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-192
	ldr r10, [fp, r9]
	push {r10}
	ldr r9, =-196
	ldr r10, [fp, r9]
	push {r10}
	bl testParam16
	mov r9, r0
	ldr r10, =-200
	str r9, [fp, r10]
	ldr r9, [fp, #-124]
	ldr r10, =-204
	str r9, [fp, r10]
	ldr r9, [fp, #-120]
	ldr r10, =-208
	str r9, [fp, r10]
	ldr r9, [fp, #-116]
	ldr r10, =-212
	str r9, [fp, r10]
	ldr r9, [fp, #-112]
	ldr r10, =-216
	str r9, [fp, r10]
	ldr r9, [fp, #-108]
	ldr r10, =-220
	str r9, [fp, r10]
	ldr r9, [fp, #-104]
	ldr r10, =-224
	str r9, [fp, r10]
	ldr r9, [fp, #-100]
	ldr r10, =-228
	str r9, [fp, r10]
	ldr r9, [fp, #-96]
	ldr r10, =-232
	str r9, [fp, r10]
	ldr r9, [fp, #-92]
	ldr r10, =-236
	str r9, [fp, r10]
	ldr r9, [fp, #-88]
	ldr r10, =-240
	str r9, [fp, r10]
	ldr r9, [fp, #-84]
	ldr r10, =-244
	str r9, [fp, r10]
	ldr r9, [fp, #-80]
	ldr r10, =-248
	str r9, [fp, r10]
	ldr r9, [fp, #-76]
	ldr r10, =-252
	str r9, [fp, r10]
	ldr r9, [fp, #-72]
	ldr r10, =-256
	str r9, [fp, r10]
	ldr r9, [fp, #-68]
	ldr r10, =-260
	str r9, [fp, r10]
	ldr r9, [fp, #-64]
	ldr r10, =-264
	str r9, [fp, r10]
	ldr r9, [fp, #-60]
	ldr r10, =-268
	str r9, [fp, r10]
	ldr r9, [fp, #-56]
	ldr r10, =-272
	str r9, [fp, r10]
	ldr r9, [fp, #-52]
	ldr r10, =-276
	str r9, [fp, r10]
	ldr r9, [fp, #-48]
	ldr r10, =-280
	str r9, [fp, r10]
	ldr r9, [fp, #-44]
	ldr r10, =-284
	str r9, [fp, r10]
	ldr r9, [fp, #-40]
	ldr r10, =-288
	str r9, [fp, r10]
	ldr r9, [fp, #-36]
	ldr r10, =-292
	str r9, [fp, r10]
	ldr r9, [fp, #-32]
	ldr r10, =-296
	str r9, [fp, r10]
	ldr r9, [fp, #-28]
	ldr r10, =-300
	str r9, [fp, r10]
	ldr r9, [fp, #-24]
	ldr r10, =-304
	str r9, [fp, r10]
	ldr r9, [fp, #-20]
	ldr r10, =-308
	str r9, [fp, r10]
	ldr r9, [fp, #-16]
	ldr r10, =-312
	str r9, [fp, r10]
	ldr r9, [fp, #-12]
	ldr r10, =-316
	str r9, [fp, r10]
	ldr r9, [fp, #-8]
	ldr r10, =-320
	str r9, [fp, r10]
	ldr r9, [fp, #-4]
	ldr r10, =-324
	str r9, [fp, r10]
	mov r0, r4
	mov r1, r5
	mov r2, r6
	mov r3, r7
	push {r8}
	ldr r4, =-332
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-328
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-132
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-136
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-140
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-144
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-148
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-152
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-156
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-160
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-164
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-168
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-172
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-176
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-180
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-184
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-188
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-192
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-196
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-200
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-204
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-208
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-212
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-216
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-220
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-224
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-228
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-232
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-236
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-240
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-244
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-248
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-252
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-256
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-260
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-264
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-268
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-272
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-276
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-280
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-284
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-288
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-292
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-296
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-300
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-304
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-308
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-312
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-316
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-320
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-324
	ldr r5, [fp, r4]
	push {r5}
	bl testParam32
	mov r4, r0
	str r4, [fp, #-128]
	ldr r4, [fp, #-128]
	mov r0, r4
	bl putint
	mov r0, #0
	add sp, sp, #128
	pop {r10}
	pop {r9}
	pop {r8}
	pop {r7}
	pop {r6}
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr

