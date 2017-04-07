.text
mov r3,#0	;i=0
mov r4,#0	;j=0
mov r5,#6	;n
sub r6,r5,#1	;n-1
ldr r10,=a
mov r8,#4
outer:
	cmp r3,r6
	bge out
	sub r7,r6,r3
inner:
	
	cmp r4,r7
	bge inout
	mul r9,r4,r8
	add r11,r4,#1
	mul r12,r11,r8
	ldr r2,[r10,r9]
	ldr r1,[r10,r12]
	cmp r2,r1
	strgt r2,[r10,r12]
	strgt r1,[r10,r9]
	add r4,r4,#1
	b inner
inout:
	mov r4,#0
	add r3,r3,#1
	b outer

out:
	ldr r0,=b
	swi 0x02
	mov r3,#0
loop:	cmp r3,r5
	bge exit
	mul r2,r3,r8
	ldr r1,[r10,r2]
	mov r0,#1
	swi 0x6b
	ldr r0,=c
	swi 0x02
	add r3,r3,#1
	b loop
exit:swi 0x11	
a:.word 100,99,20,13,6,4
b:.asciz "sorted array is "
c:.asciz " "
.end