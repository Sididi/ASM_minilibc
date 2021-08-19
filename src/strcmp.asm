global 	strcmp

strcmp:
		xor 	rcx, rcx 				;initializes our counter

.loop:
 		movzx 	rax, byte [rdi + rcx]	;moves str[i] in rax
		cmp 	al, 0x0					;if it is the end of the string
		je 		.end					;then computes the return value
		cmp 	al, byte [rsi + rcx]	;or if str[i] != str2[i]
		jne 	.end					;also computes the return value
		inc 	rcx						;otherwise increments our counter
		jmp 	.loop					;and jumps back to the beggining

.end:
		movzx 	r10, byte [rsi + rcx]	;moves str2[i] in another register
		sub 	rax, r10				;and substracts it to rax (which is str[i])
		ret