global 	read

read:
		mov 	rax, 0x0 ;READ --> %rax 0
		syscall
		ret