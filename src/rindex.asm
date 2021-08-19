global 	rindex

rindex:
		xor 	rax, rax

.loop:
		cmp 	byte [rdi], sil
		je 		.update

.loop2:
		cmp  	byte [rdi], 0x0
		je 		.end
		inc 	rdi
		jmp 	.loop

.update:
		mov 	rax, rdi
		jmp 	.loop2

.end:
		ret