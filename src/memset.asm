global 	memset

memset:
		mov 	rax, rdi				;sets return value to void *s
		xor 	rcx, rcx 				;sets our counter to 0

.loop:
		cmp 	rdx, rcx				;if our counter equals rdx (which means everything is filled)
		je 		.exit					;then return
		mov 	byte [rdi + rcx], sil	;s[n] = c
		inc 	rcx						;otherwise increments our counter
		jmp 	.loop					;and continue

.exit:
		ret