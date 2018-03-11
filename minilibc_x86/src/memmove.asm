	bits 32
	global memmove:function
	extern malloc
	extern memcpy
	extern free

	section .text:
	; void *memmove(void *dest, const void *src, size_t n)
memmove:
	; EBP + 0x8 = dest
	; EBP + 0xC = src
	; EBP + 0x10 = n

	push ebp
	mov ebp, esp

	mov edx, DWORD [ebp + 0x10]
	push edx	; Or: sub esp, 0x14 ; faster but cryptic
	call malloc WRT ..plt
	add esp, 0x4	; Or: add esp, 0x14

	mov edx, DWORD [ebp + 0x10]
	push edx
	mov edx, DWORD [ebp + 0xC]
	push edx
	push eax
	call memcpy WRT ..plt
	add esp, 0xC

	mov edx, DWORD [ebp + 0x10]
	push edx
	push eax
	mov edx, DWORD [ebp + 0x8]
	push edx
	call memcpy WRT ..plt
	add esp, 0xC

	mov eax, DWORD [ebp + 0x8]

	pop ebp
	ret