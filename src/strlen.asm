global	strlen

strlen:
		xor 		rax, rax				;sets the length to 0

.loop:
		inc 		rdi 					;increments the length by 1
		inc 		rax						;goes further in the string
		cmp 		BYTE [rdi - 1], 0x0		;checks weither its the end of the string or not
		jne 		.loop					;if not, loops again
		dec 		rax						;decrements length by 1 (cause rax is incremened at the beggining)
		ret