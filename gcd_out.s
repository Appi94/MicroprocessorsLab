.text
mov r3,#5
mov r1,#12


loop:
	cmp r3,r1
	beq exit
	blt less
	sub r3,r3,r1
	b loop
less:
	sub r1,r1,r3
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