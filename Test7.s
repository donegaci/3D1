; Test 7 Stacks


	AREA	Test7, CODE, READONLY
	IMPORT	main
	EXPORT	start
start

;Q1
	LDR r12, =0xA1000400
	LDR r0, =0xF9
	SUB r12, r12, #4
	STR r0, [r12]
	LDR r0, =0x8A
	SUB r12, r12, #4
	STR r0, [r12]
	LDR r0, =0xE6
	SUB r12, r12, #4
	STR r0, [r12]
	LDR r0, [r12]
	ADD r12, r12, #4
	LDR r0, [r12]
	ADD r12, r12, #4
	SUB r0, #0xB5
	
;Q2
	LDR r12, =0xA1000400
	LDR r0, =0xF0
	LDR r1, =0xBB
	LDR r2, =0xFE
	LDR r5, =0x38
	STMDB r12!, {r0-r2, r5}
	LDR r0, [r12, #8]
	SUB r0, #0x7A
	
;Q3
	LDR r12, =0xA1000400
	LDR r0, =0xDA
	STR r0, [r12, #-4]!
	LDR r0, =0x8B
	STR r0, [r12, #-4]!
	LDR r0, =0xD0
	STR r0, [r12, #-4]!
	LDMIA r12!, {r0-r2}
	SUB r2, #0xE6
	
;Q4
	LDR r0, =0xA1000400
	LDR r1, =string
wh1 
	LDRB r2, [r1], #1
	CMP r2, #0
	BEQ endwh
	STR r2, [r0, #-4]!
	B wh1
endwh 
	LDR r12, [r0, #8]
	;Data Segment Little Endian Format
string 
	DCB "OXgFOIab3eCY",0



stop	B	stop
	END
