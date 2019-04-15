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
		adr		r0, numbers
		ldr		r1, [r0]
		ldr		r2, [r0, #4]
		mov		r3, #0
		mov		r4, #0
		mov		r5, #0
		b		loop
		
loop
		tst		r2, #1
		beq		doshift
		adds		r4, r4, r1
		adc		r5, r5, r3
		b		doshift
		
doshift
		lsr		r2, r2, #1
		lsls		r1, r1, #1
		adc		R3, R3, #0
		cmp		r2, #0
		bgt		loop
		adr		r0, result
		str		r4, [r0]
		adr		r0, carry
		mov		r7, r5, lsr #31
		tst		r7, #1
		beq		doflip
		
doflip
		mvn		r5, r5
		add		r5, r5, #1
		b		savetomem
		
savetomem
		str		r5, [r0]
		end
		
numbers	DCD		0xA0BCFF0D, 0xFFF0ADEA
result	FILL		8
carry	FILL		4
		
