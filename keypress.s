.text

mov r0,#0
mov r1,#6


key:
	swi 0x203
	cmp r0,#0
	beq key
	
	clz r3,r0
	mov r0,#6
	ldr r2,=a
	swi 0x204
	
	rsb r2,r3,#32
	sub r4,r2,#1
	add r1,r1,#1
	swi 0x205
	
	add r1,r1,#1
	ldr r2,=b
	swi 0x204

	add r1,r1,#1
	mov r2,r4,asr #2
	add r2,r2,#1
	swi 0x205

	add r1,r1,#1
	ldr r2,=c
	swi 0x204

	add r1,r1,#1
	and r2,r4,#3
	add r2,r2,#1
	swi 0x205
	swi 0x11
a:.asciz "the key pressed is "
b:.asciz "the row is "
c:.asciz "the col is "
.end