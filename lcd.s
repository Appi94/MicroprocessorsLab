.text

.equ A,0x80
.equ B,0x40
.equ C,0x20
.equ D,0x08
.equ E,0x04
.equ F,0x02
.equ G,0x01
c:.word 100000

table:
	.word A|B|C|D|E|G
	.word B|C
	.word A|B|F|E|D
	.word A|B|F|C|D
	.word G|F|B|C
	.word A|G|F|C|D
	.word A|G|E|D|C|F
	.word A|B|C
	.word A|B|F|G|E|D|C
	.word A|B|F|G|C|D
	.word E|F|G|A|B|C
	.word A|B|F|G|C|D|E
	.word A|G|E|D
	.word G|A|B|C|D|E
	.word A|G|F|E|D
	.word A|G|F|E

ldr r2,=table
mov r9,r2
mov r3,#4
mov r4,#16
mul r5,r3,r4
add r9,r9,r5
swi 0x202
cmp r0,#0x02
bleq disp
blne disp1

mov r1,#0
disp:
	ldr r0,[r2],#4
	swi 0x200
	bl delay
	add r1,r1,#1
	cmp r1,#16
	bne disp
	swi 0x11

disp1:
	ldr r0,[r9,#-4]!
	swi 0x200
	bl delay
	sub r4,r4,#1
	cmp r4,#0
	bne disp1
	swi 0x11

delay:
	ldr r6,=c
	ldr r6,[r6]
loop:
	cmp r6,#0
	beq exit
	sub r6,r6,#1
	b loop
exit:mov pc,lr

.end