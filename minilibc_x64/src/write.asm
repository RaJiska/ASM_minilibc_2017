	bits 64
	global write:function

	section .text:
	; ssize_t write(int fd, const void *buf, size_t count)
write:
	; RDI = fd
	; RSI = buf
	; RDX = count

	mov rax, 0x1
	syscall
	ret