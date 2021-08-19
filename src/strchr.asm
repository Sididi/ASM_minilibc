global	strchr

strchr:
		xor 	rax, rax			;sets return value to NULL

.loop:
		mov 	dl, BYTE [rdi]		;copies the byte to be compared in another register
		cmp 	dl, sil				;checks weither the character given in parameter is found in the string or not
		je 		.found				;if found, copies its adress then returns
		cmp 	dl, 0x0				;then checks if its not the end of the string
		je 		.exit				;if it is, simply returns (NULL)
		inc		rdi					;goes further in the string
		jmp 	.loop				;loop

.found:
		mov 	rax, rdi			;copies its adress
		jmp 	.exit				;then returns

.exit:
		ret