; Start of file ValToHex.s
;
; Copyright 2017 University of Dublin. All Rights Reserved.
;
; Design and write an ARM assembly language program to 
; convert a 32 bit unsigned value stored in r1
; to it's hexadecimal ASCII string representation.
; Store the resulting string beginning at address 
; 0xA1000400. Your answer should contain 8 characters
; including leading zeros where appropriate, and
; should use uppercase 'A'-'F'.

	AREA	ValToHex, CODE, READONLY
	IMPORT	main
	EXPORT	start
start

	;LDR	r1, =0xFEED1234
	LDR	r1, =0x0000D1234

; Your uploaded solution should be code that goes
; between the dashed lines.
; ARM syntax requires instructions to be indented by
; at least one space or tab.
; -------------- start cut ------------------------

; My algorithm is as follows:
; Look at least significant four bits with mask
; if 0 <= x <=9
; 	ascii = x+30
; else if 9< x <=F
;	ascii = x +41
; store ascii in memory address
; decrement memory adress by 1
; repeat 8 times
	
	LDR 		r0, =0xA1000407 ; memory address for string
	MOV		r2, #0 ; initialise
	MOV		r3, #0xF ; mask for 4LSB (...0001111)
	LDR		r4, =8 ; count = 8

loop
	AND		r5, r1, r3 ; load rightmost 4 bits into r5
	CMP		r5, #9;
	BLS		if_number ; if x <= 9
	B		if_letter ; otherwise
if_number
	ADD		r5, r5, #0x30 ; x = x +30
	B		endif_letter
if_letter
	ADD		r5, r5, #0x37 ; x = x + 37
endif_letter
	STRB		r5, [r0], #-1; address = x, increment address by 2
	MOV		r1, r1, LSR #4 ; shift r2 right 4 bits 
	SUB		r4, r4, #1 ; count--
	CMP		r4, #0
	BEQ		end_loop ; 
	B		loop ; while(count > 8)
end_loop




; -------------- end cut --------------------------

stop	B	stop
	END
;
; End of file ValToHex.s