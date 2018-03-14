	bits 32
	global write:function

	section .text:
	; ssize_t write(int fd, const void *buf, size_t count)
write:
	; EBP + 0x8 = fd
	; EBP + 0xC = buf
	; EBP + 0x10 = count

	push ebp
	mov ebp, esp

	push ebx
	mov eax, 0x4
	mov ebx, DWORD [ebp + 0x8]
	mov ecx, DWORD [ebp + 0xC]
	mov edx, DWORD [ebp + 0x10]
	int 0x80
	pop ebx

	pop ebp
	ret