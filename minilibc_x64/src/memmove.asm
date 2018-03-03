bits 64
	global memmove:function
	extern malloc
	extern memcpy
	extern free

	section .text:
	; void *memmove(void *dest, const void *src, size_t n)
memmove:
	; RDI = dest
	; RSI = src
	; RDX = n

	push rdi	; RSP - 0x10
	push rsi	; RSP - 0x8
	push rdx	; RSP

	mov rdi, [rsp]	; n (Restore RDX)
	call malloc WRT ..plt

	mov rdi, rax	; dest
	mov rsi, [rsp + 0x8]	; src (Restore RSI)
	mov rdx, [rsp]	; n (Restore RDX)
	call memcpy WRT ..plt

	mov rdi, [rsp + 0x10]	; dest (Restore RDI)
	mov rsi, rax
	mov rdx, [rsp]
	push rax
	call memcpy WRT ..plt

	pop rdi
	call free WRT ..plt

	pop rdx
	pop rsi
	pop rdi

	ret