
	AREA	EXAM, CODE, READONLY
	IMPORT	main
	EXPORT	start
start


	MOV		r0, #0 ; cardinality counter
	LDR		r1, =test
	LDR		r3, =0xA1000400 ; Memory addres for storing new values

; Read the word values from memory
; Ignore comma and whitespace
loop
	LDRB		r2, [r1], #1
	CMP		r2, #0
	BEQ		end_loop
	CMP 		r2, #' '
	BEQ		loop
	CMP		r2, #','
	BEQ		loop
; Look through memory at the values already read in
; If value not found add to memory and increase cardinality
check_unique
	MOV		r12, r3 ; copy the current memory address
	MOV		r4, r0 ; y = cardinality
	CMP		r4, #0 ; Check if cardinality is zero
	BNE 		while
	ADD		r0, #1 ; if cardinality is zero increase  by 1
	STRB		r2, [r3], #1 ; store value in memory
	B		loop
while	
	CMP		r4, #0 ; while y != 0
	BEQ		end_while
	LDRB		r6, [r12, #-1]! ; get value from memory
	CMP		r6, r2 ; check if it's already been seen
	BEQ		loop ; if it has skip
	SUB		r4, #1 ; y--
	B 		while
end_while
	STRB		r2, [r3], #1 ; store new value in memory
	ADD		r0, #1 ; increase cardinality
	B		loop
end_loop

test
	DCB		"1, 4, 7, 4, 1",0


stop	B	stop
	AREA	EXAM, DATA, READWRITE
	END