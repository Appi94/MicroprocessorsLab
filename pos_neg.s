.text
mov r0,#8
ldr r1,=a
mov r2,#0	;0 count
mov r3,#0	;pos count
mov r4,#0	;neg count
mov r5,#0
loop:
	cmp r5,#8
	bge exit
	ldr r6,[r1],#4
	cmp r6,#0
	blt neg_count
	beq zero_count
	bgt pos_count
neg_count:
		add r4,r4,#1
		add r5,r5,#1
		b loop
zero_count:
		add r2,r2,#1
		add r5,r5,#1
		b loop
pos_count:
		add r3,r3,#1
		add r5,r5,#1
		b loop
exit:
	ldr r0,=b
	swi 0x02
	mov r0,#1
	mov r1,r3
	swi 0x6b
	ldr r0,=c
	swi 0x02
	mov r0,#1
	mov r1,r4
	swi 0x6b
	ldr r0,=d
	swi 0x02
	mov r0,#1
	mov r1,r2
	swi 0x6b
	swi 0x11





a:.word 0,1,-2,3,-4,0,0,2
b:.asciz "the number of positive numbers "
c:.asciz "the number of negative numbers "
d:.asciz "the number of zeroes "
.end