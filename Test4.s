	AREA	Test4, CODE, READONLY
	IMPORT	main
	EXPORT	start
		
start

;Question1
        	LDR	r0, =0x3
		LDR 	r1, =0x8F
		CMP	r0, r1
		BGE 	a_label
		SUBS	r1, r1, #0xC9
a_label
		BLO	end
		SUBS	r1, r1, #0x7D
end
	
	
;Question2
      	 	LDR	r0, =0x72
		LDR 	r1, =0xDB
		CMP	r0, r1
		BGE 	a_label
		SUBS	r1, r1, #0xAA
a_label
		BLE	end
		SUBS	r1, r1, #0xEA
end

;Question3
		MOV 	r0, #1
		MOV	r1, #0x3
		MOV	r2, #0x3
		MOVS	r2, r2
while
		BEQ	end
		MUL	r0, r1, r0
		SUBS	r2, r2, #1
		B	while
end

;Question4
		MOV	r1, #0x1
		MOV	r2, #0x3
		CMP	r2, #0
		BNE	else1
else1
		MOV	r0, r1
		CMP	r2, #1
		BLS	end
		SUBS	r2,r2, #1
do1
		MUL	r0, r1, r0
		SUBS	r2, r2, #1
		BNE	do1	
end

	
stop	B	stop

	END	