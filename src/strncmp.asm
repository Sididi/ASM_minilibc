global 	strncmp

strncmp:
		xor 	r10, r10 				;initializes our counter
		;dec 	rdx

.loop:
		cmp 	r10, rdx 				;if our counter equals size_t n
		je 		.end_0					;it means it is the end
 		movzx 	rax, byte [rdi + r10]	;moves str[i] in rax
		cmp 	al, 0x0					;if it is the end of the string
		je 		.end					;then computes the return value
		cmp 	al, byte [rsi + r10]	;or if str[i] != str2[i]
		jne 	.end					;also computes the return value
		inc 	r10						;otherwise increments our counter
		jmp 	.loop					;and jumps back to the beggining

.end:
		movzx 	r10, byte [rsi + r10]	;moves str2[i] in another register
		sub 	rax, r10				;and substracts it to rax (which is str[i])
		ret

.end_0:
		mov 	rax, 0x0
		ret