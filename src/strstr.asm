global 	strstr

strstr:
		xor 	rcx, rcx 				;inits our counter
		mov 	r10b, byte [rsi] 		;stores the first character of needle
		cmp 	r10b, 0x0 				;special case where the needle is an empty string
		je 		.empty_needle 			;we return str

.main_loop:
		cmp 	byte [rdi + rcx], 0x0 	;if str[i] == '\0'
		je 		.not_found 				;it means the occurences wasnt found
		cmp 	byte [rdi + rcx], r10b 	;if str[i] == needle[0]
		je 		.call_sub_loop 			;calls another loop to find if its a good occurence or not
		jmp 	.callback_main_loop 	;otherwise simply loops again

.call_sub_loop:
		mov 	rdx, rcx 				;inits another counter to the value of rcx
		xor 	r9, r9 					;inits a temporary counter for the needle

.sub_loop:
		mov 	r11b, byte [rsi + r9] 	;moves needle[r9] in a temp register
		cmp 	r11b, 0x0 				;if needle[r9] == '\0'
		je 		.end 					;it means its the end and the occurence was correctly found
		cmp 	r11b, byte [rdi + rdx]	;else if needle[r9] := str[i]
		jne 	.callback_main_loop 	;it means the occurence wasnt find in this subloop, we call back the main loop
		inc 	rdx 					;rdx++
		inc 	r9 						;r9++
		jmp 	.sub_loop 				;loops again

.callback_main_loop:
		inc 	rcx 					;increments our main counter
		jmp 	.main_loop 				;and goes at the beginning of our main loop

.empty_needle:
		mov 	rax, rdi   				;we store the address of str
		ret 							;then returns it

.not_found:
		mov 	rax, 0x0 				;so we return null
		ret

.end:
		mov 	rax, rdi 				;the return value is the address of the string given in parameter
		add 	rax, rcx 				;+ the index at which the sub-string was found
		ret