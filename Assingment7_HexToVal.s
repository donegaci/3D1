; Start of file HexToVal.s
;
; Copyright 2017 University of Dublin. All Rights Reserved.
;
; Design and write an ARM assembly language program that
; will convert an ASCII representation of a hexadecimal
; value to a value. TestStr is a NULL-terminated string 
; in memory and the converted value should be stored in 
; register r0. TestStr will contain a maximum of 8
; characters and may use both upper and lower case
; charaters.

	AREA	HexToVal, CODE, READONLY
	IMPORT	main
	EXPORT	start
start

; Your uploaded solution should be code that goes
; between the dashed lines.
; ARM syntax requires instructions to be indented by
; at least one space or tab.
; -------------- start cut ------------------------
	LDR		r1, =TestStr
	MOV		r0, #0 ; Initialise to 0
	
loop
	LDRB		r3, [r1], #1 ; get byte
	CMP		r3, #0 ; check if we reached NULL terminated character
	BEQ		end_loop
	MOV		r0, r0, LSL #4 ; Shift left four bits (1 hex value)
	; Convert any lower case letter to upper case
	CMP 		r3, #'a' ; if char >= 'a'
	BCC		endif_1 ; AND
	CMP		r3, #'z' ; char <= 'z'
	BHI		endif_1
	BIC		r3, #0x20 ; char = char AND NOT 0x20 (subtracts hex 20 )
endif_1
	;convert ascii hex representation to hex
	CMP		r3, #'A' ; if char >= 'A'
	BCC		else2
	SUB		r3, r3, #'A' ; char - 'A'
	ADD		r3, r3, #0xA ; char + 10
	B		end_else2
else2
	SUB		r3, r3, #'0'; char - '0' 
end_else2
	ORR		r0, r0, r3 ; put hex value into r0
	B		loop
end_loop

; -------------- end cut --------------------------

stop	B	stop
	AREA	HexToVal, DATA, READWRITE
TestStr	DCB	"123aBc12",0
	END
;
; End of file HexToVal.s