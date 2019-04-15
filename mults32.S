		;		ARM Programming Assignment #2: 32 bit signed integer multiplier
		;
		;		Write a 32-bit SIGNED multiplier. It should take only a small modification to your
		;		unsigned version. Remember (-6)*(-6) = 36, (-6)*6 = -36.
		;		Use the standard shift-and-add operation.
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.
		
		;		Your code here
		
main
		adr		R0, numbers
		ldr		R1, [R0]			; multiplicand
		ldr		R2, [R0, #4]		; multiplier
		mov		R3, #0			; partial sum right
		mov		R4, #0			; partial sum left
		mov		R5, #32			; counter
		b		docarry
		
docarry
		lsrs		R2, R2, #1
		bcs		doadd
		b		doshift
		
doadd
		adds		R3, R3, R1
		bvs		dosumleft
		b		doshift
		
dosumleft
		add		R4, R4, #1
		;lsl		R4, R4, #1
		b		doshift
		
doshift
		lsl		R1, R1, #1
		subs		R5, R5, #1
		cmp		R5, #0
		bne		docarry
		b		movetomem
		
movetomem
		adr		R0, result
		stmfa	R0, {R3, R4}
		end

		;10100000101111001111111100001101, 11111111111100001010110111101010
		
numbers	DCD		0xA0BCFF0D, 0xFFF0ADEA	
result	FILL		8
carry	FILL		4
