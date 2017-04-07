.text
a:.word 1
b:.asciz "odd parity "
c:.asciz "even parity "
mov r0,#0
ldr r1,=a
ldr r1,[r1]
mov r5,#0
mov r7,#0
loop:cmp r0,#32
	bgt exit
	and r6,r1,#1
	cmp r6,#1
	beq incr_count
	add r0,r0,#1
	mov r6,r6,asr #1
	b loop
incr_count:
		add r7,r7,#1
		add r0,r0,#1
		mov r6,r6,asr #1
		b loop
exit:
	and r8,r7,#1
	cmp r8,#1
	beq odd
	bne even
odd:
	ldr r0,=b
	swi 0x02
	swi 0x11
even:
	ldr r0,=c
	swi 0x02
	swi 0x11
.end	