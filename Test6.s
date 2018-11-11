
;TEST 5

	AREA	Test5, CODE, READONLY
	IMPORT	main
	EXPORT	start
start
; -------------- start cut --------------------------

;Q1
	LDR 	r0, =nums
	MOV 	r1, #0
	LDRB 	r2, [r0], #2
	ADD	 	r1, r2
	LDRB	 r2, [r0], #2
	ADD 	r1, r2
	LDRB 	r2, [r0, #2]
	ADD 	r1, r2
	LDRB 	r2, [r0, #-1]!
	ADD 	r1, r2
	LDRB 	r2, [r0, #-2]!
	ADD 	r1, r2
;Data Segment Little Endian Format
nums 
	DCB 	0x9, 0x1, 0x7, 0x3
	DCB 	0x2, 0x7, 0x6, 0xD
	
	
;Q2
	MOV 	r0, #0
	LDR 	r1, =nums
	MOV 	r2, #0
do1 	
	LDR 	r3, [r1, r2, LSL #2]
	ADD 	r0, r0, r3
	ADD 	r2, #1
	CMP 	r2, #8
	BCC 	do1
;Data Segment Big Endian Format
nums 
	DCD 0x3, 0x4, 0xC, 0x6
	DCD 0x8, 0xB, 0xF, 0xA


;Q3
	LDR		r0, =nums
	MOV	 	r1, #0
	LDRSB 	r2, [r0], #2
	ADD 	r1, r2
	LDRSB 	r2, [r0, #-1]!
	ADD 	r1, r2
	LDRSB	r2, [r0, #2]
	ADD 	r1, r2
;Data Segment Little Endian Format
nums 
	DCB 	0xC4, 0x7A, 0xEC, 0xC5
	DCB 	0x90, 0xF2, 0x73, 0xF4
	
	
;Q4
	LDR 	r0, =string
	LDR 	r3, =0xA0000400
loop 
	LDRB 	r2, [r0], #1
	STRB 	r2, [r3], #1
	CMP 	r2, #0
	BNE 	loop
	LDR 	r3, =0xA0000400
	LDRB 	r4, [r3, #3]
;Data Segment Little Endian Format
string
	DCB 	"ckEU4J1YuszN",0
; -------------- end cut --------------------------

stop	B	stop
	END
