	bits 64
	global read:function
	extern __errno_location
	;extern errno

	section .text:
	; ssize_t read(int fd, void *buf, size_t count)
read:
	; RDI = fd
	; RSI = buf
	; RDX = count

	mov rax, 0x0
	syscall

	cmp rax, 0
	jge short .return
	cmp rax, -4096
	jl short .return
	mov rdx, rax
	neg DWORD edx
	call __errno_location WRT ..plt
	mov DWORD [rax], edx
	mov rax, -1

	.return:

	ret