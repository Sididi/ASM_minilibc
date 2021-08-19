global 	memmove

memmove:
		mov 	rax, rdi 				;sets return value to char *dest
		xor 	rcx, rcx 				;init our counter
		cmp 	rdi, rsi 				;if src < dest
		jl 	 	.loop_lower 			;copies the bytes normally
		mov 	rcx, rdx 				;otherwise sets our counter to n
		jmp 	.loop_greater			;and copies the bytes downwards

.loop_lower:
		cmp 	rcx, rdx 				;checks if our counter == rdx
		je 		.end					;if so, exits
		mov 	r10b, byte [rsi + rcx]	;stores the byte to be copied in temp register
		mov 	byte [rdi + rcx], r10b	;then transfers that byte to char *dest
		inc 	rcx 					;increments our counter
		jmp 	.loop_lower 			;otherwise continues

.loop_greater:
		cmp 	rcx, 0					;if we copied everything
		je 		.end					;it returns
		dec 	rcx 					;otherwise it decrements the counter
		mov 	r10b, byte [rsi + rcx]	;stores the byte to be copied in temp register
		mov 	byte [rdi + rcx], r10b	;then transfers that byte to char *dest
		jmp 	.loop_greater 			;and does it again

.end:
		ret