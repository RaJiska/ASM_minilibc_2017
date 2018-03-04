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

	push rbp
	mov rbp, rsp

	sub rsp, 0x18	; 3 longs

	mov [rbp - 0x8], rdi
	mov [rbp - 0x10], rsi
	mov [rbp - 0x18], rdx

	mov rdi, [rbp - 0x18]	; n (Restore RDX)
	call malloc WRT ..plt

	mov rdi, rax	; dest
	mov rsi, [rbp - 0x10]	; src (Restore RSI)
	mov rdx, [rbp - 0x18]	; n (Restore RDX)
	call memcpy WRT ..plt

	;mov [rbp - 0x20], rax

	mov rdi, [rbp - 0x8]	; dest (Restore RDI)
	mov rsi, rax
	mov rdx, [rbp - 0x18]
	call memcpy WRT ..plt

	;mov rdi, [rbp - 0x20]
	;call free WRT ..plt

	add rsp, 0x18

	pop rbp
	ret