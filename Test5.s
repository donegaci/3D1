
;TEST 5

	AREA	Test5, CODE, READONLY
	IMPORT	main
	EXPORT	start
start


;Q1
	LDR 	r0, =str
	MOV 	r1, #0
loop 
	LDRB 	r2, [r0], #1
	ADD 	r1, r1, #1
	CMP 	r2, #0
	BNE 	loop
	SUB 	r1, r1, #1
;Data Segment Little Endian Format
str 
	DCB 	"mCQ5Gtq",0


;Q2
	LDR 	r0, =eoa
	LDR 	r1, =arr
	MOV 	r3, #0
loop 
	LDRB 	r2, [r1], #1
	ADD 	r3, r2, r3
	CMP 	r1, r0
	BNE 	loop
;Data Segment Little Endian Format
arr 
	DCB 	0xCB, 0xF9, 0xB, 0x81
eoa 
	DCB 	0


;Q3
	MOV 	r2, #0
	LDR 	r1, =nums
	LDR 	r0, [r1]
	LDR 	r3, =5
do1
	LDR 	r4, [r1, r2]
	CMP 	r0, r4
	BGE 	next
	MOV 	r0, r4
next 	
	ADD 	r2, r2, #4
	SUBS 	r3, r3, #1
	BCS 	do1
;Data Segment Big Endian Format
nums 
	DCD 	0x554, 0xC9F
	DCD 	0xC8F, 0xBC8
	DCD 	0xBD5


;Q4
	LDR 	r0, =test
	MOV 	r1, #0
loop 
	LDRB 	r2, [r0]
	CMP 	r2, #0x5A
	BLO 	skip
	ADD 	r1, r1, #1
skip 
	ADD 	r0, #1
	CMP 	r2, #0
	BNE 	loop
;Data Segment Little Endian Format
test 
	DCB 	"9lo6NDhk",0


; -------------- end cut --------------------------

stop	B	stop
	END
