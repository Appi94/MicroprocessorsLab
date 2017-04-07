.text
c:.asciz "the convolution is"
a:.word 1,3,2,5,6
b:.word 2,4,6,7,8

ldr r1,=a
ldr r2,=b
mov r3,#5	;lenght

mov r0,#0	;i=0
mov r9,#0
loop:
	cmp r0,r3
	bge exit
	ldr r6,[r1]
	ldr r8,[r2]
	mla r9,r6,r8,r9
	add r1,r1,#4
	add r2,r2,#4
	add r0,r0,#1
	b loop
exit:
	ldr r0,=c
	swi 0x02
	mov r0,#1
	mov r1,r9
	swi 0x6b
	swi 0x11

.end