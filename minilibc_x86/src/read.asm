	bits 32
	global read:function

	section .text:
	; ssize_t read(int fd, void *buf, size_t count)
read:
	; EBP + 0x8 = fd
	; EBP + 0xC = buf
	; EBP + 0x10 = count

	push ebp
	mov ebp, esp

	push ebx
	mov eax, 0x3
	mov ebx, DWORD [ebp + 0x8]
	mov ecx, DWORD [ebp + 0xC]
	mov edx, DWORD [ebp + 0x10]
	int 0x80
	pop ebx

	pop ebp
	ret