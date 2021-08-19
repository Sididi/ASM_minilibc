global 	strpbrk

strpbrk:
		xor 	rax, rax 				;sets return value to NULL

.loop:
		mov 	r8b, byte [rdi] 		;moves str[i] into r8b
		cmp 	r8b, 0x0 				;if str[i] == '\0'
		je 		.end 					;then returns (NULL)

.init_sub_loop:
		xor 	rcx, rcx 				;we setup a counter for our sub-loop

.sub_loop:
		cmp 	byte [rsi + rcx], r8b 	;if a character in the 2nd string corresponds to r8b
		je 		.found_occurence 		;then we return its address
		cmp 	byte [rsi + rcx], 0x0 	;otherwise we check if its the end of the 2nd string
		je 		.loop2 					;and if so, we continue to our main loop
		inc 	rcx 					;else we increment our counter
		jmp 	.sub_loop 				;and loop again

.loop2:
		inc 	rdi 					;the 2nd part of our main loop where we increment str
		jmp 	.loop

.found_occurence:
		mov 	rax, rdi 				;we store the address of the occurence

.end:
		ret		