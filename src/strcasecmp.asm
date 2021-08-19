global 	strcasecmp

strcasecmp:
		xor 	rcx, rcx 				;initializes our counter

.loop:
 		movzx 	rax, byte [rdi + rcx]	;moves str[i] in rax
 		movzx 	rdx, byte [rsi + rcx] 	;moves str2[i] in rdx

.update_case1:
		cmp 	rax, 0x41				;if str[i] >= A
		jge 	.update_case1_greater 	;checks if <= Z
		jmp 	.update_case2 			;otherwise ignores it

.update_case1_greater:
		cmp 	rax, 0x5A				;if str[i] <= 2
		jle 	.update_case1_end 		;updates its value
		jmp 	.update_case2 			;otherwise tries to lower str2[i]

.update_case1_end:
		add 	rax, 0x20 				;lowers str[i]

.update_case2:
		cmp 	rdx, 0x41				;if str2[i] >= A
		jge 	.update_case2_greater 	;checks if <= Z
		jmp 	.loop2 					;otherwise ignores it

.update_case2_greater:
		cmp 	rdx, 0x5A 				;if str2[i] <= Z
		jle 	.update_case2_end 		;updates its value
		jmp 	.loop2  				;otherwise don't change anything

.update_case2_end:
		add 	rdx, 0x20 				;lowers str2[i]

.loop2:
		cmp 	al, 0x0					;if it is the end of the string
		je 		.end					;then computes the return value
		cmp 	al, dl					;or if str[i] != str2[i]
		jne 	.end					;also computes the return value
		inc 	rcx						;otherwise increments our counter
		jmp 	.loop					;and jumps back to the beggining

.end:
		movzx 	r10, dl	;moves str2[i] in another register
		sub 	rax, r10				;and substracts it to rax (which is str[i])
		ret