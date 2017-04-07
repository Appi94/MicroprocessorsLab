.text

mov r5,#1
mov r2,#0
mov r4,#0
mov r9,#10
bl fib

finish:swi 0x11

fib:
	cmp r9,#0
	blt finish
	mov r0,#1
	mov r1,r5
	swi 0x6b
	ldr r0,=a
	swi 0x02
	add r2,r4,r5
	mov r4,r5
	mov r5,r2
	sub r9,r9,#1
	b fib
	mov pc,lr
a:.asciz ","
.end
	
