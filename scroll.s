.text

mov r0,#0
mov r1,#0

loop1:
	ldr r2,=a
	cmp r0,#30
	bgt loop2
	swi 0x206
	swi 0x204	
	bl delay
	add r0,r0,#1
	b loop1

loop2:
	ldr r2,=b
	ldr r2,[r2]
	cmp r0,#0
	blt exit
	swi 0x206
	swi 0x205
	bl delay
	sub r0,r0,#1
	b loop2

exit:swi 0x11

delay:
	ldr r1,=c
	ldr r1,[r1]
loop:
	cmp r1,#0
	subne r1,r1,#1
	bne loop
	mov pc,lr
a:.asciz "hello"
b:.word 45
c:.word 100000
d:.word 0x00,0x01,0x02,0x03
.end