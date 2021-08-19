global 	write

write:
		mov 	rax, 0x1 ;WRITE --> %rax 1
		syscall
		ret