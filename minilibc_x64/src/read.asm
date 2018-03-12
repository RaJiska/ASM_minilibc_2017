	bits 64
	global read:function

	section .text:
	; ssize_t read(int fd, void *buf, size_t count)
write:
	; RDI = fd
	; RSI = buf
	; RDX = count

	mov rax, 0x0
	syscall
	ret