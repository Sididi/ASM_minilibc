global 	memcpy

memcpy:
		mov 	rax, rdi 				;sets return value to char *dest
		xor 	rcx, rcx 				;init our counter

.loop:
		cmp 	rcx, rdx 				;checks if our counter == rdx
		je 		.exit 					;if so, exits
		mov 	r10b, byte [rsi + rcx]	;stores the byte to be copied in temp register
		mov 	byte [rdi + rcx], r10b	;then transfers that byte to char *dest
		inc 	rcx 					;increments our counter
		jmp 	.loop 					;otherwise continues

.exit:
	ret