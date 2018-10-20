; Start of file Hamming.s
;
; Copyright 2017 University of Dublin. All Rights Reserved.
;
; Design and write an assembly language program that 
; generates a 12-bit Hamming Code in R0 from an 8-bit value in R1.
; 

	AREA	Hamming, CODE, READONLY
	IMPORT	main
	EXPORT	start
start

	LDR		r1, =0xAC


; Your uploaded solution show be code that goes
; between the dashed lines.
; ARM syntax requires instructions to be indented by
; at least one space or tab.
; -------------- start cut ------------------------

	MOV 	r0, #0 ; clear out register 
	MOV 	r3, r1 ; copy the given 8bit value into r3
	
; First copy 8bit value into 12bit value in R0, inserting blank hamming codes
	MOV		r3, r3, LSL #2 ; skip over two hamming bits
	MOV		r2, #0x4	; mask for bit2
	AND 		r4, r2, r3 ; identify bit 2
	ORR		r0, r0, r4 ; copy bit 2
	
	MOV		r3, r3, LSL #1 ; skip over 1 hamming bit
	MOV		r2, #0x70	; mask for bits 4,5,6
	AND 		r4, r2, r3 ; identify bit 4, 5, 6
	ORR		r0, r0, r4 ; copy bits 4, 5, 5
	
	MOV		r3, r3, LSL #1 ; skip over 1 hamming bit
	MOV		r2, #0xF00 ; mask for bits 8,9,10,11
	AND 		r4, r2, r3 ; identify bit 8,9,10,11
	ORR		r0, r0, r4 ; copy bits 8,9,10,11
	

; Check bit c0 in bit position 0 is calculated to produce even parity for bits
; 2, 4, 6, 8, and 10.
	MOV		r2, #0; this will store sum of bits
	MOV		r3, r0; copy value into r3
	MOV		r4, #1 ; mask for LSB
	
	MOV		r3, r3, LSR #2 ; shift bits right by 2
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total
	
	MOV		r3, r3, LSR #2 ; shift bits right by 2
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total
	
	MOV		r3, r3, LSR #2 ; shift bits right by 2
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total

	MOV		r3, r3, LSR #2 ; shift bits right by 2
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total
	
	MOV		r3, r3, LSR #2 ; shift bits right by 2
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total

	; We now have no ob 1's in bits 2,4,6,8 stored in r2
	; If the number is odd R2 LSB will be 1
	AND		r5, r2, r4 ; identify LSB
	ORR		r0, r0, r5; If the number was odd turn on bit in c0
	
	
; Check bit c1 in bit position 1 is calculated to produce even parity for bits
; 2, 5, 6, 9 and 10.
	MOV		r2, #0; this will store sum of bits
	MOV		r3, r0; copy value into r3
	MOV		r4, #1 ; mask for LSB
	
	MOV		r3, r3, LSR #2
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total
	
	MOV		r3, r3, LSR #3
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total
		
	MOV		r3, r3, LSR #1
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total
	
	MOV		r3, r3, LSR #3
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total
	
	MOV		r3, r3, LSR #1
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total
	
	; We now have no ob 1's in bits 2,5,6,9,10 stored in r2
	; If the number is odd R2 LSB will be 1
	AND		r5, r2, r4 ; identify LSB
	MOV		r5, r5, LSL #1 ; place in bit position 1
	ORR		r0, r0, r5; If the number was odd turn on bit in c1


; Check bit c2 in bit position 3 is calculated to produce even parity for bits
; 4, 5, 6 and 11.
	MOV		r2, #0; this will store sum of bits
	MOV		r3, r0; copy value into r3
	MOV		r4, #1 ; mask for LSB
	
	MOV		r3, r3, LSR #4 
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total
	
	MOV		r3, r3, LSR #1 
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total
	
	MOV		r3, r3, LSR #1
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total
	
	MOV		r3, r3, LSR #5
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total
	
	; We now have no ob 1's in bits 4,5,6,11 stored in r2
	; If the number is odd R2 LSB will be 1
	AND		r5, r2, r4 ; identify LSB
	MOV		r5, r5, LSL #3 ; place in bit position 3
	ORR		r0, r0, r5; If the number was odd turn on bit in c2
	
	
;Check bit c3 in bit position 7 is calculated to produce even parity for bits
;8, 9, 10 and 11.

	MOV		r2, #0; this will store sum of bits
	MOV		r3, r0; copy value into r3
	MOV		r4, #1 ; mask for LSB
	
	MOV		r3, r3, LSR #8
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total
	
	MOV		r3, r3, LSR #1
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total
	
	MOV		r3, r3, LSR #1
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total

	MOV		r3, r3, LSR #1
	AND		r5,	r3, r4; identify value of LSB
	ADD		r2, r2, r5; add to sum total7
	
	; We now have no ob 1's in bits 8,9,10,11 stored in r2
	; If the number is odd R2 LSB will be 1
	AND		r5, r2, r4 ; identify LSB
	MOV		r5, r5, LSL #7 ; place in bit position 7
	ORR		r0, r0, r5; If the number was odd turn on bit in c2

; -------------- end cut --------------------------

stop	B	stop
	END
;
; End of file Hamming.s