.text
mov r3,#5
mov r1,#10


loop:
	cmp r3,r1
	beq exit
	sublt r1,r1,r3
	subgt r3,r3,r1
	b loop
exit:
	ldr r0,=a
	swi 0x02
	mov r0,#1
	mov r1,r3
	swi 0x6b
	swi 0x11
a:.asciz "gcd is "
.end