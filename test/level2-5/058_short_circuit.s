	.arch armv8-a
	.arch_extension crc
	.arm
	.data
	.global g
	.align 4
	.size g, 4
g:
	.word 0
	.text
	.global func
	.type func , %function
func:
	push {lr}
	push {fp}
	push {r4}
	push {r5}
	push {r6}
	mov fp, sp
	sub sp, sp, #4
.L69:
	str r0, [fp, #-4]
	ldr r4, addr_g0
	ldr r5, [r4]
	ldr r4, [fp, #-4]
	add r6, r5, r4
	ldr r4, addr_g0
	str r6, [r4]
	ldr r4, addr_g0
	ldr r5, [r4]
	mov r0, r5
	bl putint
	ldr r4, addr_g0
	ldr r5, [r4]
	mov r0, r5
	add sp, sp, #4
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
	mov fp, sp
	sub sp, sp, #4
.L73:
	mov r0, v6
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =10
	cmp r4, r5
	mov r4, #0
	movgt r4, #1
	bgt .L78
	b .L76
.L75:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L77
.L76:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L77
.L77:
	mov r0, v14
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =11
	cmp r4, r5
	mov r4, #0
	movgt r4, #1
	bgt .L82
	b .L80
.L78:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L75
	b .L76
.L79:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L81
.L80:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L81
.L81:
	mov r0, v23
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =99
	cmp r4, r5
	mov r4, #0
	movle r4, #1
	ble .L83
	b .L86
.L82:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L79
	b .L80
.L83:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L85
.L84:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L85
.L85:
	mov r0, v32
	bl getint
	mov r4, r0
	str r4, [fp, #-4]
	ldr r4, [fp, #-4]
	ldr r5, =100
	cmp r4, r5
	mov r4, #0
	movle r4, #1
	ble .L87
	b .L90
.L86:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L83
	b .L84
.L87:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L89
.L88:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L89
.L89:
	ldr r0, =99
	bl func
	mov r4, r0
.L90:
	ldr r4, [fp, #-4]
	mov r0, r4
	bl func
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L87
	b .L88
.L91:
	ldr r4, =1
	str r4, [fp, #-4]
	b .L93
.L92:
	ldr r4, =0
	str r4, [fp, #-4]
	b .L93
.L93:
	mov r0, #0
	add sp, sp, #4
	pop {r5}
	pop {r4}
	pop {fp}
	pop {lr}
	bx lr
.L94:
	ldr r0, =100
	bl func
	mov r4, r0
	ldr r5, =0
	cmp r4, r5
	mov r4, #0
	movne r4, #1
	bne .L91
	b .L92

addr_g0:
	.word g
