.text

mov r5,#6	;length
mov r4,#0	;i=0
mov r3,#10	;key
ldr r2,=a
loop:
	cmp r4,r5
	bge exit
	ldr r6,[r2],#4
	cmp r6,r3
	beq found
	add r4,r4,#1
	b loop
found:
	ldr r0,=b
	swi 0x02
	mov r0,#1
	add r1,r4,#1
	swi 0x6b
	swi 0x11

exit:
	ldr r0,=c
	swi 0x02
	swi 0x11



a:.word 3,1,6,9,11,10
b:.asciz "found at "
c:.asciz "not found "
.end