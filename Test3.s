	AREA	Demo, CODE, READONLY
	IMPORT	main
	EXPORT	start

start
;Q1
	LDR 	r0, =0x9C25
	LDR 	r1, =0x2EA3
	AND 	r4, r1, r0
	
;Q2
	LDR 	r0, =0x4709
	LDR 	r1, =0x9e64
	ORRS 	r4, r1, r0, LSL #4
	
;Q3
	MOV	r2, #0x0
	LDR 	r1, =0x6D
	MOVS	r1, r1, LSR #1
	ADC	r2, r2, #0
	MOVS	r1, r1, LSR #1
	ADC	r2, r2, #0
	
;Q1
	LDR 	r0, =0x72A4
	LDR 	r1, =0x422B
	EOR 	r4, r1, r0, ROR #6
	
	
	
stop	B	stop

	END	
