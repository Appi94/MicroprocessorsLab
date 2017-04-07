.text

ldr r1,=a
mov r2,#0	;low
mov r3,#7
mov r7,#9
loop:
	cmp r2,r3
	bgt exit
	add r4,r2,r3
	mov r8,r4,asr #1
	
	ldrb r6,[r1,r8]
	cmp r6,r7
	beq found
	addlt r2,r8,#1
	subgt r3,r8,#1
	b loop

found:
	ldr r0,=b
	swi 0x02
	mov r0,#1
	mov r1,r8
	swi 0x6b
	swi 0x11
exit:
	ldr r0,=c
	swi 0x02
	swi 0x11 








a:.byte 1,2,3,5,6,8,9
b:.asciz "found at "
c:.asciz "not found "
.end