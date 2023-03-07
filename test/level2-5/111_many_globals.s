	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global a0
	.align 4
	.size a0, 4
a0:
	.word 0
	.global a1
	.align 4
	.size a1, 4
a1:
	.word 0
	.global a2
	.align 4
	.size a2, 4
a2:
	.word 0
	.global a3
	.align 4
	.size a3, 4
a3:
	.word 0
	.global a4
	.align 4
	.size a4, 4
a4:
	.word 0
	.global a5
	.align 4
	.size a5, 4
a5:
	.word 0
	.global a6
	.align 4
	.size a6, 4
a6:
	.word 0
	.global a7
	.align 4
	.size a7, 4
a7:
	.word 0
	.global a8
	.align 4
	.size a8, 4
a8:
	.word 0
	.global a9
	.align 4
	.size a9, 4
a9:
	.word 0
	.global a10
	.align 4
	.size a10, 4
a10:
	.word 0
	.global a11
	.align 4
	.size a11, 4
a11:
	.word 0
	.global a12
	.align 4
	.size a12, 4
a12:
	.word 0
	.global a13
	.align 4
	.size a13, 4
a13:
	.word 0
	.global a14
	.align 4
	.size a14, 4
a14:
	.word 0
	.global a15
	.align 4
	.size a15, 4
a15:
	.word 0
	.global a16
	.align 4
	.size a16, 4
a16:
	.word 0
	.global a17
	.align 4
	.size a17, 4
a17:
	.word 0
	.global a18
	.align 4
	.size a18, 4
a18:
	.word 0
	.global a19
	.align 4
	.size a19, 4
a19:
	.word 0
	.global a20
	.align 4
	.size a20, 4
a20:
	.word 0
	.global a21
	.align 4
	.size a21, 4
a21:
	.word 0
	.global a22
	.align 4
	.size a22, 4
a22:
	.word 0
	.global a23
	.align 4
	.size a23, 4
a23:
	.word 0
	.global a24
	.align 4
	.size a24, 4
a24:
	.word 0
	.global a25
	.align 4
	.size a25, 4
a25:
	.word 0
	.global a26
	.align 4
	.size a26, 4
a26:
	.word 0
	.global a27
	.align 4
	.size a27, 4
a27:
	.word 0
	.global a28
	.align 4
	.size a28, 4
a28:
	.word 0
	.global a29
	.align 4
	.size a29, 4
a29:
	.word 0
	.global a30
	.align 4
	.size a30, 4
a30:
	.word 0
	.global a31
	.align 4
	.size a31, 4
a31:
	.word 0
	.global a32
	.align 4
	.size a32, 4
a32:
	.word 0
	.global a33
	.align 4
	.size a33, 4
a33:
	.word 0
	.global a34
	.align 4
	.size a34, 4
a34:
	.word 0
	.global a35
	.align 4
	.size a35, 4
a35:
	.word 0
	.global a36
	.align 4
	.size a36, 4
a36:
	.word 0
	.global a37
	.align 4
	.size a37, 4
a37:
	.word 0
	.global a38
	.align 4
	.size a38, 4
a38:
	.word 0
	.global a39
	.align 4
	.size a39, 4
a39:
	.word 0
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
.L319:
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
	add r6, r4, r5
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
.L342:
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
	sub r6, r5, r4
	ldr r4, [fp, #-48]
	sub r5, r6, r4
	ldr r4, [fp, #-44]
	sub r6, r5, r4
	ldr r4, [fp, #-40]
	sub r5, r6, r4
	ldr r4, [fp, #-36]
	sub r6, r5, r4
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
	mov fp, sp
	sub sp, sp, #128
.L389:
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
	add r6, r4, r5
	ldr r4, [fp, #-120]
	add r5, r6, r4
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
	add r5, r6, r4
	ldr r4, [fp, #-76]
	add r6, r5, r4
	ldr r4, [fp, #-72]
	add r5, r6, r4
	ldr r4, [fp, #-68]
	add r6, r5, r4
	ldr r4, [fp, #-64]
	add r5, r6, r4
	ldr r4, [fp, #-60]
	add r6, r5, r4
	ldr r4, [fp, #-56]
	sub r5, r6, r4
	ldr r4, [fp, #-52]
	sub r6, r5, r4
	ldr r4, [fp, #-48]
	sub r5, r6, r4
	ldr r4, [fp, #-44]
	sub r6, r5, r4
	ldr r4, [fp, #-40]
	sub r5, r6, r4
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
	sub sp, sp, #164
.L484:
	ldr r4, =0
	ldr r5, addr_a00
	str r4, [r5]
	ldr r4, =1
	ldr r5, addr_a10
	str r4, [r5]
	ldr r4, =2
	ldr r5, addr_a20
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_a30
	str r4, [r5]
	ldr r4, =4
	ldr r5, addr_a40
	str r4, [r5]
	ldr r4, =5
	ldr r5, addr_a50
	str r4, [r5]
	ldr r4, =6
	ldr r5, addr_a60
	str r4, [r5]
	ldr r4, =7
	ldr r5, addr_a70
	str r4, [r5]
	ldr r4, =8
	ldr r5, addr_a80
	str r4, [r5]
	ldr r4, =9
	ldr r5, addr_a90
	str r4, [r5]
	ldr r4, =0
	ldr r5, addr_a100
	str r4, [r5]
	ldr r4, =1
	ldr r5, addr_a110
	str r4, [r5]
	ldr r4, =2
	ldr r5, addr_a120
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_a130
	str r4, [r5]
	ldr r4, =4
	ldr r5, addr_a140
	str r4, [r5]
	ldr r4, =5
	ldr r5, addr_a150
	str r4, [r5]
	ldr r4, =6
	ldr r5, addr_a160
	str r4, [r5]
	ldr r4, =7
	ldr r5, addr_a170
	str r4, [r5]
	ldr r4, =8
	ldr r5, addr_a180
	str r4, [r5]
	ldr r4, =9
	ldr r5, addr_a190
	str r4, [r5]
	ldr r4, =0
	ldr r5, addr_a200
	str r4, [r5]
	ldr r4, =1
	ldr r5, addr_a210
	str r4, [r5]
	ldr r4, =2
	ldr r5, addr_a220
	str r4, [r5]
	ldr r4, =3
	ldr r5, addr_a230
	str r4, [r5]
	ldr r4, =4
	ldr r5, addr_a240
	str r4, [r5]
	ldr r4, =5
	ldr r5, addr_a250
	str r4, [r5]
	ldr r4, =6
	ldr r5, addr_a260
	str r4, [r5]
	ldr r4, =7
	ldr r5, addr_a270
	str r4, [r5]
	ldr r4, =8
	ldr r5, addr_a280
	str r4, [r5]
	ldr r4, =9
	ldr r5, addr_a290
	str r4, [r5]
	ldr r4, =0
	ldr r5, addr_a300
	str r4, [r5]
	ldr r4, =1
	ldr r5, addr_a310
	str r4, [r5]
	ldr r4, =4
	ldr r5, addr_a320
	str r4, [r5]
	ldr r4, =5
	ldr r5, addr_a330
	str r4, [r5]
	ldr r4, =6
	ldr r5, addr_a340
	str r4, [r5]
	ldr r4, =7
	ldr r5, addr_a350
	str r4, [r5]
	ldr r4, =8
	ldr r5, addr_a360
	str r4, [r5]
	ldr r4, =9
	ldr r5, addr_a370
	str r4, [r5]
	ldr r4, =0
	ldr r5, addr_a380
	str r4, [r5]
	ldr r4, =1
	ldr r5, addr_a390
	str r4, [r5]
	ldr r4, addr_a00
	ldr r5, [r4]
	ldr r4, addr_a10
	ldr r6, [r4]
	ldr r4, addr_a20
	ldr r7, [r4]
	ldr r4, addr_a30
	ldr r8, [r4]
	ldr r4, addr_a40
	ldr r9, [r4]
	ldr r4, addr_a50
	ldr r10, [r4]
	ldr r4, =-156
	str r10, [fp, r4]
	ldr r4, addr_a60
	ldr r10, [r4]
	ldr r4, =-4
	str r10, [fp, r4]
	ldr r4, addr_a70
	ldr r10, [r4]
	ldr r4, =-8
	str r10, [fp, r4]
	mov r0, r5
	mov r1, r6
	mov r2, r7
	mov r3, r8
	push {r9}
	ldr r4, =-156
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-4
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-8
	ldr r5, [fp, r4]
	push {r5}
	bl testParam8
	mov r4, r0
	ldr r5, addr_a00
	str r4, [r5]
	ldr r4, addr_a00
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r4, addr_a320
	ldr r5, [r4]
	ldr r4, addr_a330
	ldr r6, [r4]
	ldr r4, addr_a340
	ldr r7, [r4]
	ldr r4, addr_a350
	ldr r8, [r4]
	ldr r4, addr_a360
	ldr r9, [r4]
	ldr r4, addr_a370
	ldr r10, [r4]
	ldr r4, =-160
	str r10, [fp, r4]
	ldr r4, addr_a380
	ldr r10, [r4]
	ldr r4, =-12
	str r10, [fp, r4]
	ldr r4, addr_a390
	ldr r10, [r4]
	ldr r4, =-16
	str r10, [fp, r4]
	ldr r4, addr_a80
	ldr r10, [r4]
	ldr r4, =-20
	str r10, [fp, r4]
	ldr r4, addr_a90
	ldr r10, [r4]
	ldr r4, =-24
	str r10, [fp, r4]
	ldr r4, addr_a100
	ldr r10, [r4]
	ldr r4, =-28
	str r10, [fp, r4]
	ldr r4, addr_a110
	ldr r10, [r4]
	ldr r4, =-32
	str r10, [fp, r4]
	ldr r4, addr_a120
	ldr r10, [r4]
	ldr r4, =-36
	str r10, [fp, r4]
	ldr r4, addr_a130
	ldr r10, [r4]
	ldr r4, =-40
	str r10, [fp, r4]
	ldr r4, addr_a140
	ldr r10, [r4]
	ldr r4, =-44
	str r10, [fp, r4]
	ldr r4, addr_a150
	ldr r10, [r4]
	ldr r4, =-48
	str r10, [fp, r4]
	mov r0, r5
	mov r1, r6
	mov r2, r7
	mov r3, r8
	push {r9}
	ldr r4, =-160
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-12
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-16
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-20
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-24
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-28
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-32
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-36
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-40
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-44
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-48
	ldr r5, [fp, r4]
	push {r5}
	bl testParam16
	mov r4, r0
	ldr r5, addr_a00
	str r4, [r5]
	ldr r4, addr_a00
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r4, addr_a00
	ldr r5, [r4]
	ldr r4, addr_a10
	ldr r6, [r4]
	ldr r4, addr_a20
	ldr r7, [r4]
	ldr r4, addr_a30
	ldr r8, [r4]
	ldr r4, addr_a40
	ldr r9, [r4]
	ldr r4, addr_a50
	ldr r10, [r4]
	ldr r4, =-164
	str r10, [fp, r4]
	ldr r4, addr_a60
	ldr r10, [r4]
	ldr r4, =-52
	str r10, [fp, r4]
	ldr r4, addr_a70
	ldr r10, [r4]
	ldr r4, =-56
	str r10, [fp, r4]
	ldr r4, addr_a80
	ldr r10, [r4]
	ldr r4, =-60
	str r10, [fp, r4]
	ldr r4, addr_a90
	ldr r10, [r4]
	ldr r4, =-64
	str r10, [fp, r4]
	ldr r4, addr_a100
	ldr r10, [r4]
	ldr r4, =-68
	str r10, [fp, r4]
	ldr r4, addr_a110
	ldr r10, [r4]
	ldr r4, =-72
	str r10, [fp, r4]
	ldr r4, addr_a120
	ldr r10, [r4]
	ldr r4, =-76
	str r10, [fp, r4]
	ldr r4, addr_a130
	ldr r10, [r4]
	ldr r4, =-80
	str r10, [fp, r4]
	ldr r4, addr_a140
	ldr r10, [r4]
	ldr r4, =-84
	str r10, [fp, r4]
	ldr r4, addr_a150
	ldr r10, [r4]
	ldr r4, =-88
	str r10, [fp, r4]
	ldr r4, addr_a160
	ldr r10, [r4]
	ldr r4, =-92
	str r10, [fp, r4]
	ldr r4, addr_a170
	ldr r10, [r4]
	ldr r4, =-96
	str r10, [fp, r4]
	ldr r4, addr_a180
	ldr r10, [r4]
	ldr r4, =-100
	str r10, [fp, r4]
	ldr r4, addr_a190
	ldr r10, [r4]
	ldr r4, =-104
	str r10, [fp, r4]
	ldr r4, addr_a200
	ldr r10, [r4]
	ldr r4, =-108
	str r10, [fp, r4]
	ldr r4, addr_a210
	ldr r10, [r4]
	ldr r4, =-112
	str r10, [fp, r4]
	ldr r4, addr_a220
	ldr r10, [r4]
	ldr r4, =-116
	str r10, [fp, r4]
	ldr r4, addr_a230
	ldr r10, [r4]
	ldr r4, =-120
	str r10, [fp, r4]
	ldr r4, addr_a240
	ldr r10, [r4]
	ldr r4, =-124
	str r10, [fp, r4]
	ldr r4, addr_a250
	ldr r10, [r4]
	ldr r4, =-128
	str r10, [fp, r4]
	ldr r4, addr_a260
	ldr r10, [r4]
	ldr r4, =-132
	str r10, [fp, r4]
	ldr r4, addr_a270
	ldr r10, [r4]
	ldr r4, =-136
	str r10, [fp, r4]
	ldr r4, addr_a280
	ldr r10, [r4]
	ldr r4, =-140
	str r10, [fp, r4]
	ldr r4, addr_a290
	ldr r10, [r4]
	ldr r4, =-144
	str r10, [fp, r4]
	ldr r4, addr_a300
	ldr r10, [r4]
	ldr r4, =-148
	str r10, [fp, r4]
	ldr r4, addr_a310
	ldr r10, [r4]
	ldr r4, =-152
	str r10, [fp, r4]
	mov r0, r5
	mov r1, r6
	mov r2, r7
	mov r3, r8
	push {r9}
	ldr r4, =-164
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-52
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-56
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-60
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-64
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-68
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-72
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-76
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-80
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-84
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-88
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-92
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-96
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-100
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-104
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-108
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-112
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-116
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-120
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-124
	ldr r5, [fp, r4]
	push {r5}
	ldr r4, =-128
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
	bl testParam32
	mov r4, r0
	ldr r5, addr_a00
	str r4, [r5]
	ldr r4, addr_a00
	ldr r5, [r4]
	mov r0, r5
	bl putint
	mov r0, #0
	add sp, sp, #0
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

addr_a00:
	.word a0
addr_a10:
	.word a1
addr_a20:
	.word a2
addr_a30:
	.word a3
addr_a40:
	.word a4
addr_a50:
	.word a5
addr_a60:
	.word a6
addr_a70:
	.word a7
addr_a80:
	.word a8
addr_a90:
	.word a9
addr_a100:
	.word a10
addr_a110:
	.word a11
addr_a120:
	.word a12
addr_a130:
	.word a13
addr_a140:
	.word a14
addr_a150:
	.word a15
addr_a160:
	.word a16
addr_a170:
	.word a17
addr_a180:
	.word a18
addr_a190:
	.word a19
addr_a200:
	.word a20
addr_a210:
	.word a21
addr_a220:
	.word a22
addr_a230:
	.word a23
addr_a240:
	.word a24
addr_a250:
	.word a25
addr_a260:
	.word a26
addr_a270:
	.word a27
addr_a280:
	.word a28
addr_a290:
	.word a29
addr_a300:
	.word a30
addr_a310:
	.word a31
addr_a320:
	.word a32
addr_a330:
	.word a33
addr_a340:
	.word a34
addr_a350:
	.word a35
addr_a360:
	.word a36
addr_a370:
	.word a37
addr_a380:
	.word a38
addr_a390:
	.word a39
