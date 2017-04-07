.text
ldr r2,=a
ldr r3,=b

mov r4,#-1

loop1:
	add r4,r4,#1
	ldrb r10,[r3,r4]
	cmp r10,#0 
	beq exit
	mov r5,r4
	mov r6,#0
loop2:
	ldrb r7,[r2,r5]
	ldrb r8,[r3,r6]
	cmp r8,#0
	beq found
	cmp r7,#0
	beq exit
	cmp r7,r8
	bne loop1
	add r5,r5,#1
	add r6,r6,#1	
	b loop2
found:
	ldr r0,=c
	swi 0x02
	swi 0x11
exit:
	ldr r0,=d
	swi 0x02
	swi 0x11

a:.asciz "lakshmi"
b:.asciz "zadu"
c:.asciz "String found"
d:.asciz "String not found"

.end