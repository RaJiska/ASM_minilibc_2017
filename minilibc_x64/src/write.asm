	bits 64
	global write:function
	extern __errno_location

	section .text:
	; ssize_t write(int fd, const void *buf, size_t count)
write:
	; RDI = fd
	; RSI = buf
	; RDX = count

	mov rax, 0x1
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