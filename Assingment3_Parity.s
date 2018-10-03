; Start of file Parity.s
;
; Copyright 2017 University of Dublin. All Rights Reserved.
;
; Design and write an assembly language program that 
; will calculate the parity bit for a 7 bit value stored in r0. 
; 
; The program should then store the computed parity bit 
; in bit 7 of r0. Assume even parity.
; 
; Using even parity, the parity bit of a value is set such that the 
; number of set bits (1's) in a value is always even.
; 

	AREA	Parity, CODE, READONLY
	IMPORT	main
	EXPORT	start
start

	LDR	r0, =0x16


; Your uploaded solution show be code that goes
; between the dashed lines.
; ARM syntax requires instructions to be indented by
; at least one space or tab.
; -------------- start cut ------------------------

	
	LDR r1, =0 ; this register will store the number of 1's 
	LDR r2, =1 ; mask for LSB
	
	; Examine each of the seven bits one by one and and if 
	; it's a 1 increment r1

	AND r3, r0, r2
	ADD r1, r1, r3
	
	MOV r4, r0, LSR #1 ; Shift all the bits to the right by one
	AND r3, r4, r2
	ADD r1, r1, r3

	MOV r4, r4, LSR #1 ; Shift all the bits to the right by one
	AND r3, r4, r2
	ADD r1, r1, r3
	
	MOV r4, r4, LSR #1 ; Shift all the bits to the right by one
	AND r3, r4, r2
	ADD r1, r1, r3
	
	MOV r4, r4, LSR #1 ; Shift all the bits to the right by one
	AND r3, r4, r2
	ADD r1, r1, r3
	
	MOV r4, r4, LSR #1 ; Shift all the bits to the right by one
	AND r3, r4, r2
	ADD r1, r1, r3
	
	MOV r4, r4, LSR #1 ; Shift all the bits to the right by one
	AND r3, r4, r2
	ADD r1, r1, r3
	
	
	; We now have the number of 1's stored in r1
	; If the number is odd r1 LSB will be 1
	AND r3, r1, r2
	MOV r3, r3, LSL #7 ; Shift to the left so that the value is in MSB
	
	ORR r0, r0, r3 ; If it was odd this will make it even and and if it was even this will do nothing
	

; -------------- end cut --------------------------

stop	B	stop
	END
;
; End of file Parity.s