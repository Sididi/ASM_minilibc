global 	strcspn

strcspn:
		xor 	rcx, rcx 				;inits our main counter

.loop:
		mov 	r8b, byte [rdi + rcx]	;stores str[i] into a temp register
		cmp 	r8b, 0x0 				;if str[i] == '\0'
		je 		.end					;we return

.init_sub_loop:
		xor 	rdx, rdx 				;otherwise we init another counter for our sub-loop

.sub_loop:
		cmp 	byte [rsi + rdx], 0x0 	;we check if its the end of str2
		je 		.loop2 					;if it is, we go back to our main loop
		cmp 	byte [rsi + rdx], r8b 	;otherwise if str[i] == str2[rdx]
		je 		.end 					;we return cause an occurence was found
		inc 	rdx 					;rdx++
		jmp 	.sub_loop

.loop2:
		inc 	rcx 					;i++
		jmp 	.loop

.end:
		mov 	rax, rcx 				;we store the value of i into rax (which is the length of initial found segment)
		ret