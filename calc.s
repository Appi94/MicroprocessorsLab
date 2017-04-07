.text

op1:swi 0x203
cmp r0,#0
beq op1
clz r6,r0
rsb r5,r6,#31
mov r0,#2
mov r1,#6
mov r2,r5
swi 0x205

op2:swi 0x203
cmp r0,#0
beq op2
clz r8,r0
rsb r7,r8,#31
mov r0,#4
mov r1,#6
mov r2,r7
swi 0x205

mov r0,#0

operand:swi 0x203
cmp r0,#0
beq operand
clz r9,r0
cmp r9,#19
beq add
cmp r9,#18
beq sub
cmp r9,#17
beq mul
cmp r9,#16
beq div




add:
	add r2,r5,r7
	b done

sub:
	sub r2,r5,r7
	b done

mul:
	mul r2,r5,r7
	b done

div:
	mov r10,#0
	loop1:
		cmp r5,r7
		blt exit
		sub r5,r5,r7
		add r10,r10,#1
		b loop1
exit:
	mov r2,r10



done:
	mov r8,r2
	mov r0,#8
	mov r1,#6
	cmp r8,#0
	blt neg
	swi 0x205
	swi 0x11

neg:
	ldr r2,=a
	sub r0,r0,#1
   	swi 0x204
	add r0,r0,#1
	rsb r8,r8,#0
	mov r2,r8
	swi 0x205
	swi 0x11
a:.asciz "-"
.end