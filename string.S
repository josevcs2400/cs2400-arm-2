			;		ARM Programming Assignment #2: Writing C-strings
			;
			;		Write a program that assembles the values in chars*
			;		into a C-style string. A C-style string is an array
			;		of byte-size characters, terminated by a NULL (0x0).
			;		Write the C-string to the FILL memory at 'string'.
			;		Note: It's up to you to declare the correct number
			;		of bytes to hold the result.
			
			;		Your code here
			
main
			adr		r8, chars0	; get address for chars0 and store in r8, use this for all chars
			adr		r9, string	; get address for string and store in r9
			
			mov		r4, #3		; counter for the 3 characters in each word, decrements from 3 to 0
			mov		r6, #95		; counter for the entire string, program ends when this reaches 0
			mov		r7, #0		; counter for chars index, increments by 4
			b		loop			; branch to loop
			
loop
			ldr		r5, [r8, r7]	; load address pointer in r8 + r7, and store in r5
			strb		r5, [r9, r4]	; store value in r5 to address pointer in r9 + r4
			
			sub		r4, r4, #1	; subtract r4 - 1, decrements counter for 3 characters
			add		r7, r7, #4	; add r7 + 4, increments chars index by 4
			
			sub		r6, r6, #1	; subtract r6 - 1, this decrements the program counter
			cmp		r6, #0		; compare r6 - 0
			beq		endprogram	; branch to endprogram if compare is equal to 0
			
			cmp		r4, #0		; compare r4 - 0
			bne		loop			; branch to loop if compare is not equal to 0
			
			b		donextchar	; branch to donextchar
			
donextchar
			add		r9, r9, #4	; add r9 + 4 and store in r9
			mov		r4, #3		; move 3 into r4
			b		loop			; branch to loop
			
endprogram
			end
			
chars0		DCD		'T', 'h', 'e', ' ', '2', '0', '1', '8', ' ', 'T', 'u'
chars1		DCD		'r', 'i', 'n', 'g', ' ', 'A', 'w', 'a', 'r', 'd', ' '
chars2		DCD		'w', 'a', 's', ' ', 'a', 'w', 'a', 'r', 'd', 'e', 'd'
chars3		DCD		' ', 't', 'o', ' ', 'B', 'e', 'n', 'g', 'i', 'o'
chars4		DCD		' ', 'H', 'i', 'n', 't', 'o', 'n', ' ', 'a', 'n'
chars5		DCD		'd', ' ', 'L', 'e', 'C', 'u', 'n', 'n', ' ', 'f', 'o'
chars6		DCD		'r', ' ', 't', 'h', 'e', 'i', 'r', ' ', 'w', 'o', 'r'
chars7		DCD		'k', ' ', 'o', 'n', ' ', 'n', 'e', 'u', 'r', 'a', 'l'
chars8		DCD		'n', 'e', 't', 'w', 'o', 'r', 'k', 's', '.'
			
			;hexadecimal
			;54,		68, 65, 20, 32, 30, 31, 38, 32, 54, 75
			;72,		69, 6E, 67, 20, 41, 77, 61, 72, 64, 20
			;77,		61, 73, 20, 61, 77, 61, 72, 64, 65, 64
			;...
			
			;decimal
			;84,		104, 101, 32,  50,  48,  49,  56,  32,  84,  117
			;114,	105,	110, 103, 32,  65,  119, 97,  114, 100, 32
			;119,	97,	115, 32,  97,  119, 97,  114, 100, 101, 100
			;32,		116, 111, 32,  66,  101, 110, 103, 105, 111, 32
			;32,		72,  105, 110, 116, 111, 110, 32,  97,  110, 32
			;100,	32,	76,  101, 67,  117, 110, 110, 32,  102, 111
			;114,	32,	116, 104, 101, 105, 114, 32,  119, 111, 114
			;107,	32,	111, 110, 32,  110, 101, 117, 114, 97,  108
			;110,	101,	116, 119, 111, 114, 107, 115, 46
			
			;count	DCD		95	; dont need this
string		FILL		96 			; there are 95 chars, FILL must be a multiple of 4, so 96
