.text

ldr r1,=a
ldr r2,=b
ldr r3,=c

mov r12,#3

oloop:
	mov r4,#3
iloop:
	mov r7,r1
	mov r8,r2
	mov r11,#3
	mov r10,#0
comp:
	ldrb r6,[r7],#1
	ldrb r5,[r8],#3
	mul r9,r5,r6
	add r10,r9,r10
	sub r11,r11,#1
	cmp r11,#0
	bne comp
	
	strb r10,[r3],#1
	add r2,r2,#1
	sub r4,r4,#1
	cmp r4,#0
	bne iloop

	add r1,r1,#3
	ldr r2,=b
	sub r12,r12,#1
	cmp r12,#0
	bne oloop
	
print:
	ldr r2,=c
	mov r11,#0
loop:
	cmp r11,#9
	beq exit
	mov r0,#1
	ldrb r1,[r2],#1
	swi 0x6b
	add r11,r11,#1
	b loop
exit:swi 0x11

a:.byte 1,1,1
  .byte 1,1,1
  .byte 1,1,1
b:.byte 1,1,1
  .byte 1,1,1
  .byte 1,1,1
c:.space 9
 .end