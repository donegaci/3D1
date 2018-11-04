; Start of file BitPattern.s
;
; Copyright 2017 University of Dublin. All Rights Reserved.
;
; Design and write an ARM Assembly Language program that will examine a
; 32-bit value stored in R1 and count the number of contiguous sequences
; of 1s and store this in R0.
; For example, the value 01110001000111101100111000111111 will give 6 in R0.
; 

	AREA	BitPattern, CODE, READONLY
	IMPORT	main
	EXPORT	start
start


	LDR	R1, =2_01110001000111101100111000111111


; Your uploaded solution should be code that goes
; between the dashed lines.
; ARM syntax requires instructions to be indented by
; at least one space or tab.
; -------------- start cut ------------------------

; Basic algorithm is
; Set `previous' to `0`.
; Shift left 1 bit.
; If `carry` = `1` and `previous` = `0` increment counter.
; Set `previous` to `carry`.
; Repeat until you have shifted left 32 times


	MOV	 	R2, R1 ; copy value into R2
	
	LDR		R3, =32 ; y = 32
	LDR		R4, =0 ; previous = 0
	LDR		R0, =0 ; counter =  0
	MOVS		R3, R3 ; set conditional flags
while	
	BEQ		endwhile ; while (y != 0 ) {		
	MOVS		R2, R2, LSL #1 ; shift left one bit and update carry flag
	BCS		if_carry ; if (caryy == 1)
	B		else_no_carry ; else
if_carry
	CMP		R4, #0 ; set the carry flag with previous - 0 
	BEQ		increment ; if (previous == 0)
	B		end_increment ; else
increment
	ADD 		R0, R0, #1 ; counter ++
end_increment
	LDR		R4, =1 ; previous = 1 (there was a carry)
	B		end_carry ; endif
else_no_carry
	LDR		R4, =0 ; previous = 0 (there was not a carry)
end_carry
	SUBS		R3, R3, #1 ; y--
	B		while ; }
endwhile





; -------------- end cut --------------------------

stop	B	stop
	END
;
; End of file BitPattern.s